# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolo_detect: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iyolo_detect:/home/jetson/yolov5_trt_ros/src/yolo_detect/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yolo_detect_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg" NAME_WE)
add_custom_target(_yolo_detect_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_detect" "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(yolo_detect
  "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_detect
)

### Generating Services

### Generating Module File
_generate_module_cpp(yolo_detect
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_detect
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yolo_detect_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yolo_detect_generate_messages yolo_detect_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg" NAME_WE)
add_dependencies(yolo_detect_generate_messages_cpp _yolo_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_detect_gencpp)
add_dependencies(yolo_detect_gencpp yolo_detect_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_detect_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(yolo_detect
  "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_detect
)

### Generating Services

### Generating Module File
_generate_module_eus(yolo_detect
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_detect
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yolo_detect_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yolo_detect_generate_messages yolo_detect_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg" NAME_WE)
add_dependencies(yolo_detect_generate_messages_eus _yolo_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_detect_geneus)
add_dependencies(yolo_detect_geneus yolo_detect_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_detect_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(yolo_detect
  "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_detect
)

### Generating Services

### Generating Module File
_generate_module_lisp(yolo_detect
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_detect
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yolo_detect_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yolo_detect_generate_messages yolo_detect_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg" NAME_WE)
add_dependencies(yolo_detect_generate_messages_lisp _yolo_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_detect_genlisp)
add_dependencies(yolo_detect_genlisp yolo_detect_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_detect_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(yolo_detect
  "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_detect
)

### Generating Services

### Generating Module File
_generate_module_nodejs(yolo_detect
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_detect
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yolo_detect_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yolo_detect_generate_messages yolo_detect_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg" NAME_WE)
add_dependencies(yolo_detect_generate_messages_nodejs _yolo_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_detect_gennodejs)
add_dependencies(yolo_detect_gennodejs yolo_detect_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_detect_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(yolo_detect
  "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_detect
)

### Generating Services

### Generating Module File
_generate_module_py(yolo_detect
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_detect
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yolo_detect_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yolo_detect_generate_messages yolo_detect_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/yolov5_trt_ros/src/yolo_detect/msg/target.msg" NAME_WE)
add_dependencies(yolo_detect_generate_messages_py _yolo_detect_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_detect_genpy)
add_dependencies(yolo_detect_genpy yolo_detect_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_detect_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_detect
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yolo_detect_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_detect
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yolo_detect_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_detect
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yolo_detect_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_detect)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_detect
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yolo_detect_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_detect)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_detect\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_detect
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yolo_detect_generate_messages_py std_msgs_generate_messages_py)
endif()
