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
  List<Doc>? docs;
  dynamic benlist;

  Data({
    required this.cust,
    required this.docs,
    required this.benlist,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cust: Cust.fromJson(json["cust"]),
    docs: json["docs"] == null ? [] : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
    benlist: json["benlist"],
  );

  Map<String, dynamic> toJson() => {
    "cust": cust.toJson(),
    "docs": docs,
    "benlist": benlist,
  };
}
class Doc {
  int? documentType;
  int? custId;
  String? documentNumber;
  DateTime? issueDate;
  DateTime? expiryDate;
  String? country;
  String? orgName;
  String? fileId;
  String? docTypeDesc;

  Doc({
    this.documentType,
    this.custId,
    this.documentNumber,
    this.issueDate,
    this.expiryDate,
    this.country,
    this.orgName,
    this.fileId,
    this.docTypeDesc,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    documentType: json["DocumentType"],
    custId: json["CustId"],
    documentNumber: json["DocumentNumber"],
    issueDate: json["IssueDate"] == null ? null : DateTime.parse(json["IssueDate"]),
    expiryDate: json["ExpiryDate"] == null ? null : DateTime.parse(json["ExpiryDate"]),
    country: json["Country"],
    orgName: json["OrgName"],
    fileId: json["FileID"],
    docTypeDesc: json["DocTypeDesc"],
  );

  Map<String, dynamic> toJson() => {
    "DocumentType": documentType,
    "CustId": custId,
    "DocumentNumber": documentNumber,
    "IssueDate": issueDate?.toIso8601String(),
    "ExpiryDate": expiryDate?.toIso8601String(),
    "Country": country,
    "OrgName": orgName,
    "FileID": fileId,
    "DocTypeDesc": docTypeDesc,
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
