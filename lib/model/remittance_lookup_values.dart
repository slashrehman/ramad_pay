import 'dart:convert';

RemittanceLookUpValues remittanceLookUpValuesFromJson(String str) => RemittanceLookUpValues.fromJson(json.decode(str));

String remittanceLookUpValuesToJson(RemittanceLookUpValues data) => json.encode(data.toJson());

class RemittanceLookUpValues {
  bool? status;
  String? message;
  Data? data;
  DateTime? timestamp;

  RemittanceLookUpValues({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  factory RemittanceLookUpValues.fromJson(Map<String, dynamic> json) => RemittanceLookUpValues(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "timestamp": timestamp?.toIso8601String(),
  };
}

class Data {
  List<BeneficiaryRefNo>? purposesOfPay;
  List<BeneficiaryRefNo>? sourceOfIncome;
  List<BeneficiaryRefNo>? incomeSourceType;
  List<BeneficiaryRefNo>? paymentMethod;
  List<BeneficiaryRefNo>? beneficiaryRefNos;

  Data({
    this.purposesOfPay,
    this.sourceOfIncome,
    this.incomeSourceType,
    this.paymentMethod,
    this.beneficiaryRefNos,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    purposesOfPay: json["purposesOfPay"] == null ? [] : List<BeneficiaryRefNo>.from(json["purposesOfPay"]!.map((x) => BeneficiaryRefNo.fromJson(x))),
    sourceOfIncome: json["sourceOfIncome"] == null ? [] : List<BeneficiaryRefNo>.from(json["sourceOfIncome"]!.map((x) => BeneficiaryRefNo.fromJson(x))),
    incomeSourceType: json["IncomeSourceType"] == null ? [] : List<BeneficiaryRefNo>.from(json["IncomeSourceType"]!.map((x) => BeneficiaryRefNo.fromJson(x))),
    paymentMethod: json["PaymentMethod"] == null ? [] : List<BeneficiaryRefNo>.from(json["PaymentMethod"]!.map((x) => BeneficiaryRefNo.fromJson(x))),
    beneficiaryRefNos: json["BeneficiaryRefNos"] == null ? [] : List<BeneficiaryRefNo>.from(json["BeneficiaryRefNos"]!.map((x) => BeneficiaryRefNo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "purposesOfPay": purposesOfPay == null ? [] : List<dynamic>.from(purposesOfPay!.map((x) => x.toJson())),
    "sourceOfIncome": sourceOfIncome == null ? [] : List<dynamic>.from(sourceOfIncome!.map((x) => x.toJson())),
    "IncomeSourceType": incomeSourceType == null ? [] : List<dynamic>.from(incomeSourceType!.map((x) => x.toJson())),
    "PaymentMethod": paymentMethod == null ? [] : List<dynamic>.from(paymentMethod!.map((x) => x.toJson())),
    "BeneficiaryRefNos": beneficiaryRefNos == null ? [] : List<dynamic>.from(beneficiaryRefNos!.map((x) => x.toJson())),
  };
}

class BeneficiaryRefNo {
  String? key;
  String? value;

  BeneficiaryRefNo({
    this.key,
    this.value,
  });

  factory BeneficiaryRefNo.fromJson(Map<String, dynamic> json) => BeneficiaryRefNo(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}