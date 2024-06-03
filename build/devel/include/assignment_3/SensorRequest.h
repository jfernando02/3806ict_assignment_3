// Generated by gencpp from file assignment_3/SensorRequest.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT_3_MESSAGE_SENSORREQUEST_H
#define ASSIGNMENT_3_MESSAGE_SENSORREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace assignment_3
{
template <class ContainerAllocator>
struct SensorRequest_
{
  typedef SensorRequest_<ContainerAllocator> Type;

  SensorRequest_()
    : sensorRange(0)
    , subID(0)  {
    }
  SensorRequest_(const ContainerAllocator& _alloc)
    : sensorRange(0)
    , subID(0)  {
  (void)_alloc;
    }



   typedef int32_t _sensorRange_type;
  _sensorRange_type sensorRange;

   typedef int32_t _subID_type;
  _subID_type subID;





  typedef boost::shared_ptr< ::assignment_3::SensorRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment_3::SensorRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SensorRequest_

typedef ::assignment_3::SensorRequest_<std::allocator<void> > SensorRequest;

typedef boost::shared_ptr< ::assignment_3::SensorRequest > SensorRequestPtr;
typedef boost::shared_ptr< ::assignment_3::SensorRequest const> SensorRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment_3::SensorRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment_3::SensorRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignment_3::SensorRequest_<ContainerAllocator1> & lhs, const ::assignment_3::SensorRequest_<ContainerAllocator2> & rhs)
{
  return lhs.sensorRange == rhs.sensorRange &&
    lhs.subID == rhs.subID;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignment_3::SensorRequest_<ContainerAllocator1> & lhs, const ::assignment_3::SensorRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignment_3

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::assignment_3::SensorRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment_3::SensorRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment_3::SensorRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment_3::SensorRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment_3::SensorRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment_3::SensorRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment_3::SensorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "989288cfff8e9e902b72e5737ffeb13a";
  }

  static const char* value(const ::assignment_3::SensorRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x989288cfff8e9e90ULL;
  static const uint64_t static_value2 = 0x2b72e5737ffeb13aULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment_3::SensorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment_3/SensorRequest";
  }

  static const char* value(const ::assignment_3::SensorRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment_3::SensorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Sensor srv models request/response for sensors\n"
"# expects a given range to look for objects\n"
"int32 sensorRange\n"
"int32 subID\n"
;
  }

  static const char* value(const ::assignment_3::SensorRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment_3::SensorRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.sensorRange);
      stream.next(m.subID);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SensorRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment_3::SensorRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment_3::SensorRequest_<ContainerAllocator>& v)
  {
    s << indent << "sensorRange: ";
    Printer<int32_t>::stream(s, indent + "  ", v.sensorRange);
    s << indent << "subID: ";
    Printer<int32_t>::stream(s, indent + "  ", v.subID);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT_3_MESSAGE_SENSORREQUEST_H
