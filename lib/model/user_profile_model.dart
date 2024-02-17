// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  bool status;
  String message;
  Data data;
  DateTime timestamp;

  UserProfileModel({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "timestamp": timestamp.toIso8601String(),
  };
}

class Data {
  Cust cust;
  dynamic docs;
  dynamic benlist;

  Data({
    required this.cust,
    required this.docs,
    required this.benlist,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cust: Cust.fromJson(json["cust"]),
    docs: json["docs"],
    benlist: json["benlist"],
  );

  Map<String, dynamic> toJson() => {
    "cust": cust.toJson(),
    "docs": docs,
    "benlist": benlist,
  };
}

class Cust {
  int refNo;
  String firstName;
  String middleName;
  String lastName;
  dynamic address;
  dynamic address2;
  dynamic dateOfBirth;
  dynamic placeOfBirth;
  String email;
  dynamic telephone;
  String mobile;
  dynamic state;
  dynamic city;
  dynamic postalCode;
  dynamic country;
  dynamic nationality;
  dynamic userId;
  dynamic occupation;

  Cust({
    required this.refNo,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.address,
    required this.address2,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.email,
    required this.telephone,
    required this.mobile,
    required this.state,
    required this.city,
    required this.postalCode,
    required this.country,
    required this.nationality,
    required this.userId,
    required this.occupation,
  });

  factory Cust.fromJson(Map<String, dynamic> json) => Cust(
    refNo: json["RefNo"],
    firstName: json["FirstName"],
    middleName: json["MiddleName"],
    lastName: json["LastName"],
    address: json["Address"],
    address2: json["Address_2"],
    dateOfBirth: json["DateOfBirth"],
    placeOfBirth: json["PlaceOfBirth"],
    email: json["Email"],
    telephone: json["Telephone"],
    mobile: json["Mobile"],
    state: json["State"],
    city: json["City"],
    postalCode: json["PostalCode"],
    country: json["Country"],
    nationality: json["Nationality"],
    userId: json["UserId"],
    occupation: json["Occupation"],
  );

  Map<String, dynamic> toJson() => {
    "RefNo": refNo,
    "FirstName": firstName,
    "MiddleName": middleName,
    "LastName": lastName,
    "Address": address,
    "Address_2": address2,
    "DateOfBirth": dateOfBirth,
    "PlaceOfBirth": placeOfBirth,
    "Email": email,
    "Telephone": telephone,
    "Mobile": mobile,
    "State": state,
    "City": city,
    "PostalCode": postalCode,
    "Country": country,
    "Nationality": nationality,
    "UserId": userId,
    "Occupation": occupation,
  };
}
