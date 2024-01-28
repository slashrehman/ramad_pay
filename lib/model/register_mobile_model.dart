import 'dart:convert';

RegisterMobileModel registerMobileModelFromJson(String str) => RegisterMobileModel.fromJson(json.decode(str));

class RegisterMobileModel {
  String? result;
  int? status;
  RegisterMobileModel({
    this.result,
    this.status
  });

  factory RegisterMobileModel.fromJson(Map<String, dynamic> json) => RegisterMobileModel(
    result: json["result"]??'',
    status: json['status']??0
  );
}
