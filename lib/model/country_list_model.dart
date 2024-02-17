
import 'dart:convert';

import 'basic_list_model.dart';

CountryListModel countryListModelFromJson(String str) => CountryListModel.fromJson(json.decode(str));

class CountryListModel {
  bool status;
  String message;
  List<DataModel> data;
  String timestamp;

  CountryListModel({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) => CountryListModel(
    status: json["status"],
    message: json["message"],
    data: List<DataModel>.from(json["data"].map((x) => DataModel.fromJson(x))),
    timestamp: json["timestamp"],
  );

}

