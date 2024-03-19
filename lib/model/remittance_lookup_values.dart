import 'dart:convert';

import 'package:ramad_pay/model/basic_list_model.dart';

RemittanceLookUpValues remittanceLookUpValuesFromJson(String str) => RemittanceLookUpValues.fromJson(json.decode(str));


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

}

class Data {
  List<DataModel>? purposesOfPay;
  List<DataModel>? sourceOfIncome;
  List<DataModel>? incomeSourceType;
  List<DataModel>? paymentMethod;
  List<DataModel>? beneficiaryRefNos;

  Data({
    this.purposesOfPay,
    this.sourceOfIncome,
    this.incomeSourceType,
    this.paymentMethod,
    this.beneficiaryRefNos,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    purposesOfPay: json["purposesOfPay"] == null ? [] : List<DataModel>.from(json["purposesOfPay"]!.map((x) => DataModel.fromJson(x))),
    sourceOfIncome: json["sourceOfIncome"] == null ? [] : List<DataModel>.from(json["sourceOfIncome"]!.map((x) => DataModel.fromJson(x))),
    incomeSourceType: json["IncomeSourceType"] == null ? [] : List<DataModel>.from(json["IncomeSourceType"]!.map((x) => DataModel.fromJson(x))),
    paymentMethod: json["PaymentMethod"] == null ? [] : List<DataModel>.from(json["PaymentMethod"]!.map((x) => DataModel.fromJson(x))),
    beneficiaryRefNos: json["BeneficiaryRefNos"] == null ? [] : List<DataModel>.from(json["BeneficiaryRefNos"]!.map((x) => DataModel.fromJson(x))),
  );

}
