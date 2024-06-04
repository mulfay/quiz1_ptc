import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
part 'json_serializable.g.dart';

mixin Base {
  Map<String, dynamic> toJson();
}

class Serializable {
  final Company company;

  Serializable({required this.company});
  factory Serializable.fromJson(Map<String, dynamic> json) => Serializable(
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {"company": company.toJson()};
}

@JsonSerializable()
class Company with Base {
  @JsonKey(name: 'is_active')
  final int isActive;
  final String name;
  final String established;
  final Address? address;
  final List<Department> departments;
  Company({
    required this.isActive,
    required this.name,
    required this.established,
    required this.address,
    required this.departments,
  });
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  String get localTimeWithFormat =>
      DateFormat('d-MMM, y').format(DateTime.parse(established).toLocal());
}

@JsonSerializable()
class Address with Base {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Department with Base {
  final String deptId;
  final String name;
  final String manager;
  final double budget;
  final int? year;
  final Availability? availability;
  @JsonKey(name: 'meeting_time')
  final String meetingTime;

  Department({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    required this.year,
    required this.availability,
    required this.meetingTime,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Availability with Base {
  @JsonKey(name: 'online')
  final bool onLine;
  final bool inStore;
  Availability({
    required this.onLine,
    required this.inStore,
  });
  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}
