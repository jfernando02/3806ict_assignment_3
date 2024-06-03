; Auto-generated. Do not edit!


(cl:in-package assignment_3-srv)


;//! \htmlinclude Sensor-request.msg.html

(cl:defclass <Sensor-request> (roslisp-msg-protocol:ros-message)
  ((sensorRange
    :reader sensorRange
    :initarg :sensorRange
    :type cl:integer
    :initform 0)
   (subID
    :reader subID
    :initarg :subID
    :type cl:integer
    :initform 0))
)

(cl:defclass Sensor-request (<Sensor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sensor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sensor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment_3-srv:<Sensor-request> is deprecated: use assignment_3-srv:Sensor-request instead.")))

(cl:ensure-generic-function 'sensorRange-val :lambda-list '(m))
(cl:defmethod sensorRange-val ((m <Sensor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:sensorRange-val is deprecated.  Use assignment_3-srv:sensorRange instead.")
  (sensorRange m))

(cl:ensure-generic-function 'subID-val :lambda-list '(m))
(cl:defmethod subID-val ((m <Sensor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:subID-val is deprecated.  Use assignment_3-srv:subID instead.")
  (subID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sensor-request>) ostream)
  "Serializes a message object of type '<Sensor-request>"
  (cl:let* ((signed (cl:slot-value msg 'sensorRange)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'subID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sensor-request>) istream)
  "Deserializes a message object of type '<Sensor-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensorRange) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'subID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sensor-request>)))
  "Returns string type for a service object of type '<Sensor-request>"
  "assignment_3/SensorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sensor-request)))
  "Returns string type for a service object of type 'Sensor-request"
  "assignment_3/SensorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sensor-request>)))
  "Returns md5sum for a message object of type '<Sensor-request>"
  "546dae9226dd84d9996bfa16115be7c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sensor-request)))
  "Returns md5sum for a message object of type 'Sensor-request"
  "546dae9226dd84d9996bfa16115be7c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sensor-request>)))
  "Returns full string definition for message of type '<Sensor-request>"
  (cl:format cl:nil "# Sensor srv models request/response for sensors~%# expects a given range to look for objects~%int32 sensorRange~%int32 subID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sensor-request)))
  "Returns full string definition for message of type 'Sensor-request"
  (cl:format cl:nil "# Sensor srv models request/response for sensors~%# expects a given range to look for objects~%int32 sensorRange~%int32 subID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sensor-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sensor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Sensor-request
    (cl:cons ':sensorRange (sensorRange msg))
    (cl:cons ':subID (subID msg))
))
;//! \htmlinclude Sensor-response.msg.html

(cl:defclass <Sensor-response> (roslisp-msg-protocol:ros-message)
  ((objectNorth
    :reader objectNorth
    :initarg :objectNorth
    :type cl:boolean
    :initform cl:nil)
   (objectSouth
    :reader objectSouth
    :initarg :objectSouth
    :type cl:boolean
    :initform cl:nil)
   (objectEast
    :reader objectEast
    :initarg :objectEast
    :type cl:boolean
    :initform cl:nil)
   (objectWest
    :reader objectWest
    :initarg :objectWest
    :type cl:boolean
    :initform cl:nil)
   (objectDetected
    :reader objectDetected
    :initarg :objectDetected
    :type cl:boolean
    :initform cl:nil)
   (northRadar
    :reader northRadar
    :initarg :northRadar
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (southRadar
    :reader southRadar
    :initarg :southRadar
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (eastRadar
    :reader eastRadar
    :initarg :eastRadar
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (westRadar
    :reader westRadar
    :initarg :westRadar
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass Sensor-response (<Sensor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sensor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sensor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment_3-srv:<Sensor-response> is deprecated: use assignment_3-srv:Sensor-response instead.")))

(cl:ensure-generic-function 'objectNorth-val :lambda-list '(m))
(cl:defmethod objectNorth-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:objectNorth-val is deprecated.  Use assignment_3-srv:objectNorth instead.")
  (objectNorth m))

(cl:ensure-generic-function 'objectSouth-val :lambda-list '(m))
(cl:defmethod objectSouth-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:objectSouth-val is deprecated.  Use assignment_3-srv:objectSouth instead.")
  (objectSouth m))

(cl:ensure-generic-function 'objectEast-val :lambda-list '(m))
(cl:defmethod objectEast-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:objectEast-val is deprecated.  Use assignment_3-srv:objectEast instead.")
  (objectEast m))

(cl:ensure-generic-function 'objectWest-val :lambda-list '(m))
(cl:defmethod objectWest-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:objectWest-val is deprecated.  Use assignment_3-srv:objectWest instead.")
  (objectWest m))

(cl:ensure-generic-function 'objectDetected-val :lambda-list '(m))
(cl:defmethod objectDetected-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:objectDetected-val is deprecated.  Use assignment_3-srv:objectDetected instead.")
  (objectDetected m))

(cl:ensure-generic-function 'northRadar-val :lambda-list '(m))
(cl:defmethod northRadar-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:northRadar-val is deprecated.  Use assignment_3-srv:northRadar instead.")
  (northRadar m))

(cl:ensure-generic-function 'southRadar-val :lambda-list '(m))
(cl:defmethod southRadar-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:southRadar-val is deprecated.  Use assignment_3-srv:southRadar instead.")
  (southRadar m))

(cl:ensure-generic-function 'eastRadar-val :lambda-list '(m))
(cl:defmethod eastRadar-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:eastRadar-val is deprecated.  Use assignment_3-srv:eastRadar instead.")
  (eastRadar m))

(cl:ensure-generic-function 'westRadar-val :lambda-list '(m))
(cl:defmethod westRadar-val ((m <Sensor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:westRadar-val is deprecated.  Use assignment_3-srv:westRadar instead.")
  (westRadar m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sensor-response>) ostream)
  "Serializes a message object of type '<Sensor-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'objectNorth) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'objectSouth) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'objectEast) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'objectWest) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'objectDetected) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'northRadar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'northRadar))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'southRadar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'southRadar))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'eastRadar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'eastRadar))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'westRadar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'westRadar))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sensor-response>) istream)
  "Deserializes a message object of type '<Sensor-response>"
    (cl:setf (cl:slot-value msg 'objectNorth) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'objectSouth) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'objectEast) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'objectWest) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'objectDetected) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'northRadar) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'northRadar)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'southRadar) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'southRadar)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'eastRadar) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'eastRadar)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'westRadar) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'westRadar)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sensor-response>)))
  "Returns string type for a service object of type '<Sensor-response>"
  "assignment_3/SensorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sensor-response)))
  "Returns string type for a service object of type 'Sensor-response"
  "assignment_3/SensorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sensor-response>)))
  "Returns md5sum for a message object of type '<Sensor-response>"
  "546dae9226dd84d9996bfa16115be7c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sensor-response)))
  "Returns md5sum for a message object of type 'Sensor-response"
  "546dae9226dd84d9996bfa16115be7c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sensor-response>)))
  "Returns full string definition for message of type '<Sensor-response>"
  (cl:format cl:nil "# boolean responses allow for easy access to whether objects were detected~%# and in which direction~%bool objectNorth~%bool objectSouth~%bool objectEast~%bool objectWest~%bool objectDetected~%~%int32[] northRadar~%int32[] southRadar~%int32[] eastRadar~%int32[] westRadar~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sensor-response)))
  "Returns full string definition for message of type 'Sensor-response"
  (cl:format cl:nil "# boolean responses allow for easy access to whether objects were detected~%# and in which direction~%bool objectNorth~%bool objectSouth~%bool objectEast~%bool objectWest~%bool objectDetected~%~%int32[] northRadar~%int32[] southRadar~%int32[] eastRadar~%int32[] westRadar~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sensor-response>))
  (cl:+ 0
     1
     1
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'northRadar) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'southRadar) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'eastRadar) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'westRadar) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sensor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Sensor-response
    (cl:cons ':objectNorth (objectNorth msg))
    (cl:cons ':objectSouth (objectSouth msg))
    (cl:cons ':objectEast (objectEast msg))
    (cl:cons ':objectWest (objectWest msg))
    (cl:cons ':objectDetected (objectDetected msg))
    (cl:cons ':northRadar (northRadar msg))
    (cl:cons ':southRadar (southRadar msg))
    (cl:cons ':eastRadar (eastRadar msg))
    (cl:cons ':westRadar (westRadar msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Sensor)))
  'Sensor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Sensor)))
  'Sensor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sensor)))
  "Returns string type for a service object of type '<Sensor>"
  "assignment_3/Sensor")