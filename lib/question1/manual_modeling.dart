import 'package:intl/intl.dart';

mixin Base {
  Map<String, dynamic> toJson();
}

class Manual {
  final Company company;

  Manual({required this.company});
  factory Manual.fromJson(Map<String, dynamic> json) => Manual(
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => company.toJson();
}

class Company with Base {
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
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      isActive: json["is_active"],
      name: json["name"],
      established: json["established"],
      address:
          json["address"] != null ? Address.fromJson(json["address"]) : null,
      departments: (json["departments"] as List)
          .map((department) => Department.fromJson(department))
          .toList(),
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      "company": {
        "is_active": isActive,
        "name": name,
        "address": address,
        "established": established,
        "departments": departments,
      }
    };
  }

//helper function
  String get localTimeWithFormat =>
      DateFormat('d-MMM, y').format(DateTime.parse(established).toLocal());
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
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json["street"]!,
        city: json["city"]!,
        state: json["state"]!,
        postalCode: json["postalCode"]!);
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "city": city,
      "state": state,
      "postalCode": postalCode,
    };
  }
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
  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
        deptId: json["deptId"],
        name: json["name"],
        manager: json["manager"],
        budget: json["budget"],
        year: json["year"],
        availability: json["availability"] != null
            ? Availability.fromJson(json["availability"])
            : null,
        meetingTime: json["meeting_time"]);
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      "deptId": deptId,
      "name": name,
      "manager": manager,
      "budget": budget,
      "year": year,
      "availability": availability,
      "meetingTime": meetingTime,
    };
  }
}

class Availability with Base {
  final bool onLine;
  final bool inStore;
  Availability({
    required this.onLine,
    required this.inStore,
  });
  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(inStore: json["inStore"], onLine: json["online"]);
  }
  @override
  Map<String, dynamic> toJson() {
    return {"online": onLine, "inStore": inStore};
  }
}
