import 'dart:convert';

BeneficiariesModel beneficiariesModelFromJson(String str) => BeneficiariesModel.fromJson(json.decode(str));

String beneficiariesModelToJson(BeneficiariesModel data) => json.encode(data.toJson());

class BeneficiariesModel {
  bool? status;
  String? message;
  List<BeneficiaryData>? data;
  DateTime? timestamp;

  BeneficiariesModel({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  factory BeneficiariesModel.fromJson(Map<String, dynamic> json) => BeneficiariesModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<BeneficiaryData>.from(json["data"]!.map((x) => BeneficiaryData.fromJson(x))),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "timestamp": timestamp?.toIso8601String(),
  };
}

class BeneficiaryData {
  int? custId;
  int? benRefNo;
  String? firstName;
  String? middleName;
  String? lastName;
  String? address;
  dynamic address2;
  dynamic dateOfBirth;
  String? email;
  String? telephone;
  String? mobile;
  String? city;
  String? state;
  String? placeOfBirth;
  String? nationality;
  String? postalCode;
  String? occupation;
  dynamic remarks;
  String? country;
  DateTime? created;
  dynamic createdBy;
  dynamic modified;
  dynamic modifiedBy;
  dynamic jubaReferenceNo;
  dynamic jubaStatus;
  String? countryIso3;

  BeneficiaryData({
    this.custId,
    this.benRefNo,
    this.firstName,
    this.middleName,
    this.lastName,
    this.address,
    this.address2,
    this.dateOfBirth,
    this.email,
    this.telephone,
    this.mobile,
    this.city,
    this.state,
    this.placeOfBirth,
    this.nationality,
    this.postalCode,
    this.occupation,
    this.remarks,
    this.country,
    this.created,
    this.createdBy,
    this.modified,
    this.modifiedBy,
    this.jubaReferenceNo,
    this.jubaStatus,
    this.countryIso3,
  });

  factory BeneficiaryData.fromJson(Map<String, dynamic> json) => BeneficiaryData(
    custId: json["CustID"],
    benRefNo: json["BenRefNo"],
    firstName: json["FirstName"],
    middleName: json["MiddleName"],
    lastName: json["LastName"],
    address: json["Address"],
    address2: json["Address_2"],
    dateOfBirth: json["DateOfBirth"],
    email: json["Email"],
    telephone: json["Telephone"],
    mobile: json["Mobile"],
    city: json["City"],
    state: json["State"],
    placeOfBirth: json["PlaceOfBirth"],
    nationality: json["Nationality"],
    postalCode: json["PostalCode"],
    occupation: json["Occupation"],
    remarks: json["Remarks"],
    country: json["Country"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    createdBy: json["CreatedBy"],
    modified: json["Modified"],
    modifiedBy: json["ModifiedBy"],
    jubaReferenceNo: json["JubaReferenceNo"],
    jubaStatus: json["JubaStatus"],
    countryIso3: json["CountryISO3"],
  );

  Map<String, dynamic> toJson() => {
    "CustID": custId,
    "BenRefNo": benRefNo,
    "FirstName": firstName,
    "MiddleName": middleName,
    "LastName": lastName,
    "Address": address,
    "Address_2": address2,
    "DateOfBirth": dateOfBirth,
    "Email": email,
    "Telephone": telephone,
    "Mobile": mobile,
    "City": city,
    "State": state,
    "PlaceOfBirth": placeOfBirth,
    "Nationality": nationality,
    "PostalCode": postalCode,
    "Occupation": occupation,
    "Remarks": remarks,
    "Country": country,
    "created": created?.toIso8601String(),
    "CreatedBy": createdBy,
    "Modified": modified,
    "ModifiedBy": modifiedBy,
    "JubaReferenceNo": jubaReferenceNo,
    "JubaStatus": jubaStatus,
    "CountryISO3": countryIso3,
  };
}
