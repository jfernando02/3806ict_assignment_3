;; Auto-generated. Do not edit!


(when (boundp 'assignment_3::Sensor)
  (if (not (find-package "ASSIGNMENT_3"))
    (make-package "ASSIGNMENT_3"))
  (shadow 'Sensor (find-package "ASSIGNMENT_3")))
(unless (find-package "ASSIGNMENT_3::SENSOR")
  (make-package "ASSIGNMENT_3::SENSOR"))
(unless (find-package "ASSIGNMENT_3::SENSORREQUEST")
  (make-package "ASSIGNMENT_3::SENSORREQUEST"))
(unless (find-package "ASSIGNMENT_3::SENSORRESPONSE")
  (make-package "ASSIGNMENT_3::SENSORRESPONSE"))

(in-package "ROS")





(defclass assignment_3::SensorRequest
  :super ros::object
  :slots (_sensorRange _subID ))

(defmethod assignment_3::SensorRequest
  (:init
   (&key
    ((:sensorRange __sensorRange) 0)
    ((:subID __subID) 0)
    )
   (send-super :init)
   (setq _sensorRange (round __sensorRange))
   (setq _subID (round __subID))
   self)
  (:sensorRange
   (&optional __sensorRange)
   (if __sensorRange (setq _sensorRange __sensorRange)) _sensorRange)
  (:subID
   (&optional __subID)
   (if __subID (setq _subID __subID)) _subID)
  (:serialization-length
   ()
   (+
    ;; int32 _sensorRange
    4
    ;; int32 _subID
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sensorRange
       (write-long _sensorRange s)
     ;; int32 _subID
       (write-long _subID s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sensorRange
     (setq _sensorRange (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _subID
     (setq _subID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass assignment_3::SensorResponse
  :super ros::object
  :slots (_objectNorth _objectSouth _objectEast _objectWest _objectDetected _northRadar _southRadar _eastRadar _westRadar ))

(defmethod assignment_3::SensorResponse
  (:init
   (&key
    ((:objectNorth __objectNorth) nil)
    ((:objectSouth __objectSouth) nil)
    ((:objectEast __objectEast) nil)
    ((:objectWest __objectWest) nil)
    ((:objectDetected __objectDetected) nil)
    ((:northRadar __northRadar) (make-array 0 :initial-element 0 :element-type :integer))
    ((:southRadar __southRadar) (make-array 0 :initial-element 0 :element-type :integer))
    ((:eastRadar __eastRadar) (make-array 0 :initial-element 0 :element-type :integer))
    ((:westRadar __westRadar) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _objectNorth __objectNorth)
   (setq _objectSouth __objectSouth)
   (setq _objectEast __objectEast)
   (setq _objectWest __objectWest)
   (setq _objectDetected __objectDetected)
   (setq _northRadar __northRadar)
   (setq _southRadar __southRadar)
   (setq _eastRadar __eastRadar)
   (setq _westRadar __westRadar)
   self)
  (:objectNorth
   (&optional (__objectNorth :null))
   (if (not (eq __objectNorth :null)) (setq _objectNorth __objectNorth)) _objectNorth)
  (:objectSouth
   (&optional (__objectSouth :null))
   (if (not (eq __objectSouth :null)) (setq _objectSouth __objectSouth)) _objectSouth)
  (:objectEast
   (&optional (__objectEast :null))
   (if (not (eq __objectEast :null)) (setq _objectEast __objectEast)) _objectEast)
  (:objectWest
   (&optional (__objectWest :null))
   (if (not (eq __objectWest :null)) (setq _objectWest __objectWest)) _objectWest)
  (:objectDetected
   (&optional (__objectDetected :null))
   (if (not (eq __objectDetected :null)) (setq _objectDetected __objectDetected)) _objectDetected)
  (:northRadar
   (&optional __northRadar)
   (if __northRadar (setq _northRadar __northRadar)) _northRadar)
  (:southRadar
   (&optional __southRadar)
   (if __southRadar (setq _southRadar __southRadar)) _southRadar)
  (:eastRadar
   (&optional __eastRadar)
   (if __eastRadar (setq _eastRadar __eastRadar)) _eastRadar)
  (:westRadar
   (&optional __westRadar)
   (if __westRadar (setq _westRadar __westRadar)) _westRadar)
  (:serialization-length
   ()
   (+
    ;; bool _objectNorth
    1
    ;; bool _objectSouth
    1
    ;; bool _objectEast
    1
    ;; bool _objectWest
    1
    ;; bool _objectDetected
    1
    ;; int32[] _northRadar
    (* 4    (length _northRadar)) 4
    ;; int32[] _southRadar
    (* 4    (length _southRadar)) 4
    ;; int32[] _eastRadar
    (* 4    (length _eastRadar)) 4
    ;; int32[] _westRadar
    (* 4    (length _westRadar)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _objectNorth
       (if _objectNorth (write-byte -1 s) (write-byte 0 s))
     ;; bool _objectSouth
       (if _objectSouth (write-byte -1 s) (write-byte 0 s))
     ;; bool _objectEast
       (if _objectEast (write-byte -1 s) (write-byte 0 s))
     ;; bool _objectWest
       (if _objectWest (write-byte -1 s) (write-byte 0 s))
     ;; bool _objectDetected
       (if _objectDetected (write-byte -1 s) (write-byte 0 s))
     ;; int32[] _northRadar
     (write-long (length _northRadar) s)
     (dotimes (i (length _northRadar))
       (write-long (elt _northRadar i) s)
       )
     ;; int32[] _southRadar
     (write-long (length _southRadar) s)
     (dotimes (i (length _southRadar))
       (write-long (elt _southRadar i) s)
       )
     ;; int32[] _eastRadar
     (write-long (length _eastRadar) s)
     (dotimes (i (length _eastRadar))
       (write-long (elt _eastRadar i) s)
       )
     ;; int32[] _westRadar
     (write-long (length _westRadar) s)
     (dotimes (i (length _westRadar))
       (write-long (elt _westRadar i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _objectNorth
     (setq _objectNorth (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _objectSouth
     (setq _objectSouth (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _objectEast
     (setq _objectEast (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _objectWest
     (setq _objectWest (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _objectDetected
     (setq _objectDetected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32[] _northRadar
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _northRadar (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _northRadar i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _southRadar
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _southRadar (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _southRadar i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _eastRadar
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _eastRadar (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _eastRadar i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _westRadar
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _westRadar (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _westRadar i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass assignment_3::Sensor
  :super ros::object
  :slots ())

(setf (get assignment_3::Sensor :md5sum-) "546dae9226dd84d9996bfa16115be7c7")
(setf (get assignment_3::Sensor :datatype-) "assignment_3/Sensor")
(setf (get assignment_3::Sensor :request) assignment_3::SensorRequest)
(setf (get assignment_3::Sensor :response) assignment_3::SensorResponse)

(defmethod assignment_3::SensorRequest
  (:response () (instance assignment_3::SensorResponse :init)))

(setf (get assignment_3::SensorRequest :md5sum-) "546dae9226dd84d9996bfa16115be7c7")
(setf (get assignment_3::SensorRequest :datatype-) "assignment_3/SensorRequest")
(setf (get assignment_3::SensorRequest :definition-)
      "# Sensor srv models request/response for sensors
# expects a given range to look for objects
int32 sensorRange
int32 subID
---
# boolean responses allow for easy access to whether objects were detected
# and in which direction
bool objectNorth
bool objectSouth
bool objectEast
bool objectWest
bool objectDetected

int32[] northRadar
int32[] southRadar
int32[] eastRadar
int32[] westRadar
")

(setf (get assignment_3::SensorResponse :md5sum-) "546dae9226dd84d9996bfa16115be7c7")
(setf (get assignment_3::SensorResponse :datatype-) "assignment_3/SensorResponse")
(setf (get assignment_3::SensorResponse :definition-)
      "# Sensor srv models request/response for sensors
# expects a given range to look for objects
int32 sensorRange
int32 subID
---
# boolean responses allow for easy access to whether objects were detected
# and in which direction
bool objectNorth
bool objectSouth
bool objectEast
bool objectWest
bool objectDetected

int32[] northRadar
int32[] southRadar
int32[] eastRadar
int32[] westRadar
")



(provide :assignment_3/Sensor "546dae9226dd84d9996bfa16115be7c7")


