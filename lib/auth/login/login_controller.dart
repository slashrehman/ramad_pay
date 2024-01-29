import 'dart:js';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ramad_pay/service/login_service.dart';
import '../../utils/snack_bar.dart';

class LoginController extends GetxController{
  TextEditingController phone = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  RxBool obscureText = false.obs;
  LoginService loginService = LoginService();

  void loginUser(){
   var requestBody =  {
      "UserName": phone.text.toString(),
    "password": loginPassword.text.toString()
  };
    loginService.loginUser(requestBody: requestBody);
  }

  @override
  void onInit() {
    super.onInit();
  }

}