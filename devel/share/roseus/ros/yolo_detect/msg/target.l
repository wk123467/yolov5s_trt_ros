;; Auto-generated. Do not edit!


(when (boundp 'yolo_detect::target)
  (if (not (find-package "YOLO_DETECT"))
    (make-package "YOLO_DETECT"))
  (shadow 'target (find-package "YOLO_DETECT")))
(unless (find-package "YOLO_DETECT::TARGET")
  (make-package "YOLO_DETECT::TARGET"))

(in-package "ROS")
;;//! \htmlinclude target.msg.html


(defclass yolo_detect::target
  :super ros::object
  :slots (_ClassName _conf _tl_x _tl_y _br_x _br_y ))

(defmethod yolo_detect::target
  (:init
   (&key
    ((:ClassName __ClassName) "")
    ((:conf __conf) 0.0)
    ((:tl_x __tl_x) 0)
    ((:tl_y __tl_y) 0)
    ((:br_x __br_x) 0)
    ((:br_y __br_y) 0)
    )
   (send-super :init)
   (setq _ClassName (string __ClassName))
   (setq _conf (float __conf))
   (setq _tl_x (round __tl_x))
   (setq _tl_y (round __tl_y))
   (setq _br_x (round __br_x))
   (setq _br_y (round __br_y))
   self)
  (:ClassName
   (&optional __ClassName)
   (if __ClassName (setq _ClassName __ClassName)) _ClassName)
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:tl_x
   (&optional __tl_x)
   (if __tl_x (setq _tl_x __tl_x)) _tl_x)
  (:tl_y
   (&optional __tl_y)
   (if __tl_y (setq _tl_y __tl_y)) _tl_y)
  (:br_x
   (&optional __br_x)
   (if __br_x (setq _br_x __br_x)) _br_x)
  (:br_y
   (&optional __br_y)
   (if __br_y (setq _br_y __br_y)) _br_y)
  (:serialization-length
   ()
   (+
    ;; string _ClassName
    4 (length _ClassName)
    ;; float32 _conf
    4
    ;; int32 _tl_x
    4
    ;; int32 _tl_y
    4
    ;; int32 _br_x
    4
    ;; int32 _br_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _ClassName
       (write-long (length _ClassName) s) (princ _ClassName s)
     ;; float32 _conf
       (sys::poke _conf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _tl_x
       (write-long _tl_x s)
     ;; int32 _tl_y
       (write-long _tl_y s)
     ;; int32 _br_x
       (write-long _br_x s)
     ;; int32 _br_y
       (write-long _br_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _ClassName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ClassName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _conf
     (setq _conf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _tl_x
     (setq _tl_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _tl_y
     (setq _tl_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _br_x
     (setq _br_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _br_y
     (setq _br_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolo_detect::target :md5sum-) "975a9db10eefa3284189115d7225099b")
(setf (get yolo_detect::target :datatype-) "yolo_detect/target")
(setf (get yolo_detect::target :definition-)
      "string ClassName
float32 conf
int32 tl_x
int32 tl_y
int32 br_x
int32 br_y

")



(provide :yolo_detect/target "975a9db10eefa3284189115d7225099b")


