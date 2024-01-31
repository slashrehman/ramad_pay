import 'dart:convert';

import 'package:ramad_pay/model/base_response_model.dart';

RegisterMobileModel registerMobileModelFromJson(String str) => RegisterMobileModel.fromJson(json.decode(str));

class RegisterMobileModel extends BaseResponseModel{
  String type;
  String title;
  String traceId;
  Errors errors;

  RegisterMobileModel({
    required this.type,
    required this.title,
     super.status,
    required this.traceId,
    required this.errors,
  });

  factory RegisterMobileModel.fromJson(Map<String, dynamic> json) => RegisterMobileModel(
    type: json["type"],
    title: json["title"],
    status: json["status"],
    traceId: json["traceId"],
    errors: Errors.fromJson(json["errors"]),
  );
}

class Errors {
  List<String> mobile;

  Errors({
    required this.mobile,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    mobile: List<String>.from(json["mobile"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mobile": List<dynamic>.from(mobile.map((x) => x)),
  };
}
