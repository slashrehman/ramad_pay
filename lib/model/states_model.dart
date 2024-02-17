import 'dart:convert';

import 'basic_list_model.dart';

BasicListModel basicListModelFromJson(String str) => BasicListModel.fromJson(json.decode(str));


class BasicListModel {
  bool status;
  String message;
  List<DataModel> data;
  String timestamp;

  BasicListModel({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory BasicListModel.fromJson(Map<String, dynamic> json) => BasicListModel(
    status: json["status"],
    message: json["message"],
    data: List<DataModel>.from(json["data"].map((x) => DataModel.fromJson(x))),
    timestamp: json["timestamp"]
  );
}

