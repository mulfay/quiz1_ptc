import 'package:intl/intl.dart';
import "package:freezed_annotation/freezed_annotation.dart";
import 'package:flutter/foundation.dart';

part 'freezed.freezed.dart';

part 'freezed.g.dart';

class Freeze {
  final Company company;

  Freeze({required this.company});
  factory Freeze.fromJson(Map<String, dynamic> json) => Freeze(
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {"company": company.toJson()};
}

@freezed
class Company with _$Company {
  const Company._();
  factory Company({
    @JsonKey(name: 'is_active') required int isActive,
    required String name,
    required String established,
    required Address? address,
    required List<Department> departments,
  }) = _Company;
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  String get localTimeWithFormat =>
      DateFormat('d-MMM, y').format(DateTime.parse(established).toLocal());
}

@freezed
class Address with _$Address {
  factory Address({
    required String street,
    required String city,
    required String state,
    required String postalCode,
  }) = _Address;
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Department with _$Department {
  factory Department({
    required String deptId,
    required String name,
    required String manager,
    required double budget,
    required int? year,
    required Availability? availability,
    @JsonKey(name: 'meeting_time') required String meetingTime,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@freezed
class Availability with _$Availability {
  factory Availability({
    @JsonKey(name: 'online') required bool onLine,
    required bool inStore,
  }) = _Availability;
  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
}
