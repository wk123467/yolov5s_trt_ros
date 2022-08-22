#include <iostream>
#include <chrono>
#include <random>
#include "cuda_runtime_api.h"
#include "logging.h"
#include "common.hpp"
#include <vector>
#include <fstream>
#include <algorithm>

#include "target.h"

//#include "Detection.h"
 
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h> //cv_bridge是在ROS图像消息和OpenCV图像之间进行转换的一个功能包。如提供sensor_msgs
 
#include <opencv2/highgui/highgui.hpp>
 
#include <iostream>
 
ros::Publisher pub;
yolo_detect::target target;
 
#include "std_msgs/Int8.h"
#include "std_msgs/String.h"

#define USE_FP16  // comment out this if want to use FP32
#define DEVICE 0  // GPU id
#define NMS_THRESH 0.5
#define CONF_THRESH 0.4
#define BATCH_SIZE 1

// stuff we know about the network and the input/output blobs
static const int INPUT_H = Yolo::INPUT_H;
static const int INPUT_W = Yolo::INPUT_W;
static const int OUTPUT_SIZE = Yolo::MAX_OUTPUT_BBOX_COUNT * sizeof(Yolo::Detection) / sizeof(float) + 1;  // we assume the yololayer outputs no more than 1000 boxes that conf >= 0.1
const char* INPUT_BLOB_NAME = "data";
const char* OUTPUT_BLOB_NAME = "prob";
static Logger gLogger;
REGISTER_TENSORRT_PLUGIN(YoloPluginCreator);
static float data[BATCH_SIZE * 3 * INPUT_H * INPUT_W];
static float prob[BATCH_SIZE * OUTPUT_SIZE];
// ----------------------- class type -------------------- //
std::vector<std::string> categories = {"person","rider","car",
                                            "bus","truck","bike","motor","tl_green",
                                            "tl_red","tl_yellow","tl_none","t_sign","train"};
// -------------------------------------------------------- //




void doInference(IExecutionContext& context, float* input, float* output, int batchSize) {
    const ICudaEngine& engine = context.getEngine();

    // Pointers to input and output device buffers to pass to engine.
    // Engine requires exactly IEngine::getNbBindings() number of buffers.
    assert(engine.getNbBindings() == 2);
    void* buffers[2];

    // In order to bind the buffers, we need to know the names of the input and output tensors.
    // Note that indices are guaranteed to be less than IEngine::getNbBindings()
    const int inputIndex = engine.getBindingIndex(INPUT_BLOB_NAME);
    const int outputIndex = engine.getBindingIndex(OUTPUT_BLOB_NAME);

    // Create GPU buffers on device
    CHECK(cudaMalloc(&buffers[inputIndex], batchSize * 3 * INPUT_H * INPUT_W * sizeof(float)));
    CHECK(cudaMalloc(&buffers[outputIndex], batchSize * OUTPUT_SIZE * sizeof(float)));

    // Create stream
    cudaStream_t stream;
    CHECK(cudaStreamCreate(&stream));

    // DMA input batch data to device, infer on the batch asynchronously, and DMA output back to host
    CHECK(cudaMemcpyAsync(buffers[inputIndex], input, batchSize * 3 * INPUT_H * INPUT_W * sizeof(float), cudaMemcpyHostToDevice, stream));
    context.enqueue(batchSize, buffers, stream, nullptr);
    CHECK(cudaMemcpyAsync(output, buffers[outputIndex], batchSize * OUTPUT_SIZE * sizeof(float), cudaMemcpyDeviceToHost, stream));
    cudaStreamSynchronize(stream);

    // Release stream and buffers
    cudaStreamDestroy(stream);
    CHECK(cudaFree(buffers[inputIndex]));
    CHECK(cudaFree(buffers[outputIndex]));
}


 
void imageCallback(const sensor_msgs::ImageConstPtr &msg, IExecutionContext* context)
{
    cv::Mat img;
    cv_bridge::CvImageConstPtr cv_ptr;
    cv_ptr = cv_bridge::toCvShare(msg, "bgr8");
    img = cv_ptr->image;
    //std::cout << "img:" << img.rows << "," << img.cols << "," << img.channels() << std::endl;
    
    

    cv::Mat pr_img = preprocess_img(img);
    // image normalization 
    int b = 0;
    for (int i = 0; i < INPUT_H * INPUT_W; i++) 
    {
        data[b * 3 * INPUT_H * INPUT_W + i] = pr_img.at<cv::Vec3b>(i)[2] / 255.0;
        data[b * 3 * INPUT_H * INPUT_W + i + INPUT_H * INPUT_W] = pr_img.at<cv::Vec3b>(i)[1] / 255.0;
        data[b * 3 * INPUT_H * INPUT_W + i + 2 * INPUT_H * INPUT_W] = pr_img.at<cv::Vec3b>(i)[0] / 255.0;
    }
    // Run inference
    auto start = std::chrono::system_clock::now();
    doInference(*context, data, prob, BATCH_SIZE);
    auto end = std::chrono::system_clock::now();
    std::cout << "Inference time: " << std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << "ms" << std::endl;
    std::vector<std::vector<Yolo::Detection>> batch_res(1);
    
    // nms
    auto& res = batch_res[0];
    nms(res, &prob[b * OUTPUT_SIZE], CONF_THRESH, NMS_THRESH);

    cv::Rect r;
    // inference results
    std::cout << "object number is: " << res.size() << std::endl;

    for (size_t j = 0; j < res.size(); j++)
    {
        int class_idx = (int)res[j].class_id;
        cv::Rect r = get_rect(img, res[j].bbox);
        //向图片中添加目标信息
        cv::rectangle(img, r, cv::Scalar(0x27, 0xC1, 0x36), 2);
        cv::putText(img, categories[class_idx], cv::Point(r.x, r.y - 1), cv::FONT_HERSHEY_PLAIN, 1.2, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
        //填充消息，并发布
        target.ClassName = categories[(int)res[j].class_id];
        target.conf = res[j].conf;
        target.tl_x = r.tl().x;
        target.tl_y = r.tl().y;
        target.br_x = r.br().x;
        target.br_y = r.br().y;
        pub.publish(target);
        ROS_INFO("Object detected === [%s]", categories[(int)res[j].class_id].c_str());
                
    }
 
    cv::imshow("YOLOv5", img);
    cv::waitKey(1); // 一定要加这个，不然不显示窗口
}
 
int main(int argc, char **argv)
{
    
    cudaSetDevice(DEVICE);
    // create a model using the API directly and serialize it to a stream
    char *trtModelStream{nullptr};
    size_t size{0};

    /**open engine*/
    std::ifstream file("/home/jetson/yolov5_trt_ros/src/yolo_detect/src/yolov5s.engine", std::ios::binary);
    if (file.good()) {
        file.seekg(0, file.end);
        size = file.tellg();
        file.seekg(0, file.beg);
        trtModelStream = new char[size];
        assert(trtModelStream);
        file.read(trtModelStream, size);
        file.close();
    }
    else
    {
     std::cout << "open engine file fail, please check!" << std::endl;
    }
    
    // ---------------------prepare input data --------------------------- //
    

    IRuntime* runtime = createInferRuntime(gLogger);
    assert(runtime != nullptr);
    ICudaEngine* engine = runtime->deserializeCudaEngine(trtModelStream, size);
    assert(engine != nullptr);
    IExecutionContext* context = engine->createExecutionContext();
    assert(context != nullptr);
    delete[] trtModelStream;
    // ------------------------------------------------------------------------ //
    
    //创建node第一步需要用到的函数
    ros::init(argc, argv, "yolov5s"); //第3个参数为本节点名，
    
 
    ros::NodeHandle nd; //实例化句柄，初始化node
 
    // Create a ROS subscriber for the input point cloud
    ros::Subscriber sub = nd.subscribe<sensor_msgs::Image>("/usb_cam/image_raw", 1, boost::bind(&imageCallback, _1, context)); 
    //std::cout << "sub:" << sub << std::endl;
 
    // Create a ROS publisher for the output
    pub = nd.advertise<yolo_detect::target>("yolov5s_result", 1);
 
    ros::spin();

    return 0;
}
