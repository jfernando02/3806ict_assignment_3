// Generated by gencpp from file assignment_3/SensorResponse.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT_3_MESSAGE_SENSORRESPONSE_H
#define ASSIGNMENT_3_MESSAGE_SENSORRESPONSE_H


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
struct SensorResponse_
{
  typedef SensorResponse_<ContainerAllocator> Type;

  SensorResponse_()
    : objectNorth(false)
    , objectSouth(false)
    , objectEast(false)
    , objectWest(false)
    , objectDetected(false)
    , northRadar()
    , southRadar()
    , eastRadar()
    , westRadar()  {
    }
  SensorResponse_(const ContainerAllocator& _alloc)
    : objectNorth(false)
    , objectSouth(false)
    , objectEast(false)
    , objectWest(false)
    , objectDetected(false)
    , northRadar(_alloc)
    , southRadar(_alloc)
    , eastRadar(_alloc)
    , westRadar(_alloc)  {
  (void)_alloc;
    }



   typedef uint8_t _objectNorth_type;
  _objectNorth_type objectNorth;

   typedef uint8_t _objectSouth_type;
  _objectSouth_type objectSouth;

   typedef uint8_t _objectEast_type;
  _objectEast_type objectEast;

   typedef uint8_t _objectWest_type;
  _objectWest_type objectWest;

   typedef uint8_t _objectDetected_type;
  _objectDetected_type objectDetected;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _northRadar_type;
  _northRadar_type northRadar;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _southRadar_type;
  _southRadar_type southRadar;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _eastRadar_type;
  _eastRadar_type eastRadar;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _westRadar_type;
  _westRadar_type westRadar;





  typedef boost::shared_ptr< ::assignment_3::SensorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment_3::SensorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SensorResponse_

typedef ::assignment_3::SensorResponse_<std::allocator<void> > SensorResponse;

typedef boost::shared_ptr< ::assignment_3::SensorResponse > SensorResponsePtr;
typedef boost::shared_ptr< ::assignment_3::SensorResponse const> SensorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment_3::SensorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment_3::SensorResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignment_3::SensorResponse_<ContainerAllocator1> & lhs, const ::assignment_3::SensorResponse_<ContainerAllocator2> & rhs)
{
  return lhs.objectNorth == rhs.objectNorth &&
    lhs.objectSouth == rhs.objectSouth &&
    lhs.objectEast == rhs.objectEast &&
    lhs.objectWest == rhs.objectWest &&
    lhs.objectDetected == rhs.objectDetected &&
    lhs.northRadar == rhs.northRadar &&
    lhs.southRadar == rhs.southRadar &&
    lhs.eastRadar == rhs.eastRadar &&
    lhs.westRadar == rhs.westRadar;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignment_3::SensorResponse_<ContainerAllocator1> & lhs, const ::assignment_3::SensorResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignment_3

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::assignment_3::SensorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment_3::SensorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment_3::SensorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment_3::SensorResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment_3::SensorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment_3::SensorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment_3::SensorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "014542b4fc21a2f4be0ac376e228b21c";
  }

  static const char* value(const ::assignment_3::SensorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x014542b4fc21a2f4ULL;
  static const uint64_t static_value2 = 0xbe0ac376e228b21cULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment_3::SensorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment_3/SensorResponse";
  }

  static const char* value(const ::assignment_3::SensorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment_3::SensorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# boolean responses allow for easy access to whether objects were detected\n"
"# and in which direction\n"
"bool objectNorth\n"
"bool objectSouth\n"
"bool objectEast\n"
"bool objectWest\n"
"bool objectDetected\n"
"\n"
"int32[] northRadar\n"
"int32[] southRadar\n"
"int32[] eastRadar\n"
"int32[] westRadar\n"
;
  }

  static const char* value(const ::assignment_3::SensorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment_3::SensorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.objectNorth);
      stream.next(m.objectSouth);
      stream.next(m.objectEast);
      stream.next(m.objectWest);
      stream.next(m.objectDetected);
      stream.next(m.northRadar);
      stream.next(m.southRadar);
      stream.next(m.eastRadar);
      stream.next(m.westRadar);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SensorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment_3::SensorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment_3::SensorResponse_<ContainerAllocator>& v)
  {
    s << indent << "objectNorth: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.objectNorth);
    s << indent << "objectSouth: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.objectSouth);
    s << indent << "objectEast: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.objectEast);
    s << indent << "objectWest: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.objectWest);
    s << indent << "objectDetected: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.objectDetected);
    s << indent << "northRadar[]" << std::endl;
    for (size_t i = 0; i < v.northRadar.size(); ++i)
    {
      s << indent << "  northRadar[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.northRadar[i]);
    }
    s << indent << "southRadar[]" << std::endl;
    for (size_t i = 0; i < v.southRadar.size(); ++i)
    {
      s << indent << "  southRadar[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.southRadar[i]);
    }
    s << indent << "eastRadar[]" << std::endl;
    for (size_t i = 0; i < v.eastRadar.size(); ++i)
    {
      s << indent << "  eastRadar[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.eastRadar[i]);
    }
    s << indent << "westRadar[]" << std::endl;
    for (size_t i = 0; i < v.westRadar.size(); ++i)
    {
      s << indent << "  westRadar[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.westRadar[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT_3_MESSAGE_SENSORRESPONSE_H