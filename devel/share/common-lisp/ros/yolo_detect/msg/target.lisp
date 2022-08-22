; Auto-generated. Do not edit!


(cl:in-package yolo_detect-msg)


;//! \htmlinclude target.msg.html

(cl:defclass <target> (roslisp-msg-protocol:ros-message)
  ((ClassName
    :reader ClassName
    :initarg :ClassName
    :type cl:string
    :initform "")
   (conf
    :reader conf
    :initarg :conf
    :type cl:float
    :initform 0.0)
   (tl_x
    :reader tl_x
    :initarg :tl_x
    :type cl:integer
    :initform 0)
   (tl_y
    :reader tl_y
    :initarg :tl_y
    :type cl:integer
    :initform 0)
   (br_x
    :reader br_x
    :initarg :br_x
    :type cl:integer
    :initform 0)
   (br_y
    :reader br_y
    :initarg :br_y
    :type cl:integer
    :initform 0))
)

(cl:defclass target (<target>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <target>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'target)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolo_detect-msg:<target> is deprecated: use yolo_detect-msg:target instead.")))

(cl:ensure-generic-function 'ClassName-val :lambda-list '(m))
(cl:defmethod ClassName-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_detect-msg:ClassName-val is deprecated.  Use yolo_detect-msg:ClassName instead.")
  (ClassName m))

(cl:ensure-generic-function 'conf-val :lambda-list '(m))
(cl:defmethod conf-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_detect-msg:conf-val is deprecated.  Use yolo_detect-msg:conf instead.")
  (conf m))

(cl:ensure-generic-function 'tl_x-val :lambda-list '(m))
(cl:defmethod tl_x-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_detect-msg:tl_x-val is deprecated.  Use yolo_detect-msg:tl_x instead.")
  (tl_x m))

(cl:ensure-generic-function 'tl_y-val :lambda-list '(m))
(cl:defmethod tl_y-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_detect-msg:tl_y-val is deprecated.  Use yolo_detect-msg:tl_y instead.")
  (tl_y m))

(cl:ensure-generic-function 'br_x-val :lambda-list '(m))
(cl:defmethod br_x-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_detect-msg:br_x-val is deprecated.  Use yolo_detect-msg:br_x instead.")
  (br_x m))

(cl:ensure-generic-function 'br_y-val :lambda-list '(m))
(cl:defmethod br_y-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_detect-msg:br_y-val is deprecated.  Use yolo_detect-msg:br_y instead.")
  (br_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <target>) ostream)
  "Serializes a message object of type '<target>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ClassName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ClassName))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'conf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'tl_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tl_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'br_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'br_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <target>) istream)
  "Deserializes a message object of type '<target>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ClassName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ClassName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'conf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tl_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tl_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'br_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'br_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<target>)))
  "Returns string type for a message object of type '<target>"
  "yolo_detect/target")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'target)))
  "Returns string type for a message object of type 'target"
  "yolo_detect/target")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<target>)))
  "Returns md5sum for a message object of type '<target>"
  "975a9db10eefa3284189115d7225099b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'target)))
  "Returns md5sum for a message object of type 'target"
  "975a9db10eefa3284189115d7225099b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<target>)))
  "Returns full string definition for message of type '<target>"
  (cl:format cl:nil "string ClassName~%float32 conf~%int32 tl_x~%int32 tl_y~%int32 br_x~%int32 br_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'target)))
  "Returns full string definition for message of type 'target"
  (cl:format cl:nil "string ClassName~%float32 conf~%int32 tl_x~%int32 tl_y~%int32 br_x~%int32 br_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <target>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'ClassName))
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <target>))
  "Converts a ROS message object to a list"
  (cl:list 'target
    (cl:cons ':ClassName (ClassName msg))
    (cl:cons ':conf (conf msg))
    (cl:cons ':tl_x (tl_x msg))
    (cl:cons ':tl_y (tl_y msg))
    (cl:cons ':br_x (br_x msg))
    (cl:cons ':br_y (br_y msg))
))
