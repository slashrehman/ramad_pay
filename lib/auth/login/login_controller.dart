import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/app_basics/app_routes.dart';
import '/service/login_service.dart';
import '/utils/loading_dialog.dart';

class LoginController extends GetxController{
  TextEditingController phone = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  RxBool obscureText = false.obs;
  LoginService loginService = LoginService();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();

  void loginUser(){
   var requestBody =  {
      "UserName": phone.text.toString(),
     "password": loginPassword.text.toString()
  };
    loginService.loginUser(requestBody: requestBody).then((value) {
      if(value){
        closeLoadingDialog();
        Get.toNamed(AppRoutes.homeScreen);
      }else{
        closeLoadingDialog();
      }
    });
  }

  void sendRestPasswordOTPEmail(){
    loginService.sendRestPasswordOTPEmail(email: email.text).then((value) {
      if(value){
        closeLoadingDialog();
        Get.toNamed(AppRoutes.resetPasswordScreen);
      }else{
        closeLoadingDialog();
      }
    });
  }
  void resetUserPassword(){
    var requestBody =  {
      "UserName": userName.text,
      "password": password.text,
      "OTP": otp.text,

    };
    loginService.resetPassword(requestBody: requestBody).then((value) {
      if(value){
        closeLoadingDialog();
        Get.toNamed(AppRoutes.homeScreen);
      }else{
        closeLoadingDialog();
      }
    });
  }
  @override
  void onInit() {
    super.onInit();
  }

}