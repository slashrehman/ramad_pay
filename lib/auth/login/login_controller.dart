import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ramad_pay/app_basics/display_text.dart';
import 'package:ramad_pay/utils/snack_bar.dart';
import '../../helpers/shared_pref_helper.dart';
import '/app_basics/app_routes.dart';
import '/service/login_service.dart';
import '/utils/loading_dialog.dart';

class LoginController extends GetxController{
  TextEditingController phone = TextEditingController(text: "slash.rehman@gmail.com");
  TextEditingController loginPassword = TextEditingController(text: "Slash.123");
  RxBool obscureText = true.obs;
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
        Get.toNamed(AppRoutes.mainScreen);
        SharedPref.instance.saveString(SharedPref.userName, phone.text.toString());
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
        showSnackBar(generalErrorText);
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
        showSnackBar(generalErrorText);
        closeLoadingDialog();
      }
    });
  }
  @override
  void onInit() {
    super.onInit();
  }

}