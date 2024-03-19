import 'dart:convert';

import 'package:ramad_pay/model/basic_list_model.dart';

GetPayModeCurrencyModel getPayModeCurrencyModelFromJson(String str) => GetPayModeCurrencyModel.fromJson(json.decode(str));

class GetPayModeCurrencyModel {
  bool? status;
  String? message;
  Data? data;
  DateTime? timestamp;

  GetPayModeCurrencyModel({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  factory GetPayModeCurrencyModel.fromJson(Map<String, dynamic> json) => GetPayModeCurrencyModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );
}

class Data {
  List<DataModel>? payMode;
  List<DataModel>? curr;

  Data({
    this.payMode,
    this.curr,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    payMode: json["payMode"] == null ? [] : List<DataModel>.from(json["payMode"]!.map((x) => DataModel.fromJson(x))),
    curr: json["Curr"] == null ? [] : List<DataModel>.from(json["Curr"]!.map((x) => DataModel.fromJson(x))),
  );
}
