import 'dart:convert';

BaseResponseModel baseResponseModel(String str) => BaseResponseModel.fromJson(json.decode(str));

class BaseResponseModel {
  var status;
  String? message;

  BaseResponseModel({this.status, this.message});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
    status : json['status'] ?? json['success'],
    message : json['message']
  );
}