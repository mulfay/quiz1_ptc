/*
i have added ternary expressions and make the attributes except null
i add helper function of time
*/
import 'package:intl/intl.dart';

mixin Base {
  Map<String, dynamic> toJson();
}

class QuickType {
  final Company company;

  QuickType({
    required this.company,
  });

  factory QuickType.fromJson(Map<String, dynamic> json) => QuickType(
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "company": company.toJson(),
      };
}

class Company with Base {
  final int companyIsActive;
  final String name;
  final Address? address;
  final DateTime established;
  final List<Department> departments;

  Company({
    required this.companyIsActive,
    required this.name,
    required this.address,
    required this.established,
    required this.departments,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyIsActive: json["is_active"],
        name: json["name"],
        address:
            json["address"] != null ? Address.fromJson(json["address"]) : null,
        established: DateTime.parse(json["established"]),
        departments: List<Department>.from(
            json["departments"].map((x) => Department.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "is_active": companyIsActive,
        "name": name,
        "address": address,
        "established": established.toIso8601String(),
        "departments": departments,
      };

  String get localTimeWithFormat =>
      DateFormat('d-MMM, y').format(established.toLocal());
}

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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "postalCode": postalCode,
      };
}

class Department with Base {
  final String deptId;
  final String name;
  final String manager;
  final double budget;
  final int? year;
  final Availability? availability;
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

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        deptId: json["deptId"],
        name: json["name"],
        manager: json["manager"],
        budget: json["budget"],
        year: json["year"],
        availability: json["availability"] != null
            ? Availability.fromJson(json["availability"])
            : null,
        meetingTime: json["meeting_time"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "deptId": deptId,
        "name": name,
        "manager": manager,
        "budget": budget,
        "year": year,
        "availability": availability,
        "meeting_time": meetingTime,
      };
}

class Availability with Base {
  final bool online;
  final bool inStore;

  Availability({
    required this.online,
    required this.inStore,
  });

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        online: json["online"],
        inStore: json["inStore"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "online": online,
        "inStore": inStore,
      };
}
