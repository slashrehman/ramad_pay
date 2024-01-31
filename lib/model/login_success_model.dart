import 'dart:convert';

import 'package:ramad_pay/model/base_response_model.dart';

LoginSuccessModel loginSuccessModelFromJson(String str) => LoginSuccessModel.fromJson(json.decode(str));

class LoginSuccessModel  extends BaseResponseModel{
  Data data;
  DateTime timestamp;
  LoginSuccessModel({
    required this.data,
    required this.timestamp,
    super.status,
    super.message
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => LoginSuccessModel(
    data: Data.fromJson(json["data"]),
    timestamp: DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"]
  );
}

class Data {
  String accesstoken;
  DateTime accExpireto;
  String refreshtoken;
  DateTime refexpireto;
  String userName;

  Data({
    required this.accesstoken,
    required this.accExpireto,
    required this.refreshtoken,
    required this.refexpireto,
    required this.userName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accesstoken: json["Accesstoken"],
    accExpireto: DateTime.parse(json["AccExpireto"]),
    refreshtoken: json["Refreshtoken"],
    refexpireto: DateTime.parse(json["Refexpireto"]),
    userName: json["userName"],
  );
}
