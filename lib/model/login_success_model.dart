import 'dart:convert';
LoginSuccessModel loginSuccessModelFromJson(String str) => LoginSuccessModel.fromJson(json.decode(str));


class LoginSuccessModel {
  String? accessToken;
  var accExpireTo;
  String? refreshToken;
  var refExpireTo;
  String? userName;
  String? error;


  LoginSuccessModel({
    this.accessToken,
    this.accExpireTo,
    this.refreshToken,
    this.refExpireTo,
    this.userName,
    this.error
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => LoginSuccessModel(
    accessToken: json["Accesstoken"]??'',
    accExpireTo: (json["AccExpireto"])??'',
    refreshToken: json["Refreshtoken"]??'',
    refExpireTo: (json["Refexpireto"])??'',
    userName: json["userName"]??'',
    error: json["error"],
  );
}
