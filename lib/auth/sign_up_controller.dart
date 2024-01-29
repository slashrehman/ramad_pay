import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/service/register_user_service.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';
import 'package:ramad_pay/utils/snack_bar.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phone = TextEditingController();
  TextEditingController promoCode = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController recoveryEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool hasReferral = false.obs;
  RxBool obscureText = false.obs;
  var country = countries.firstWhere((element) => element.code == 'US');
  RxBool isPhoneNumberValid = false.obs;
  var start = 30.obs;
  void startTimer(){
    Timer.periodic(Duration(seconds: 1), (_) {
      start.value--;
    });
  }
  final RegisterService _registerService = RegisterService();
  void registerMobile() {
    var requestBody = {
      "mobile": phone.text,
      "proCode": promoCode.text.toString(),
    };
    _registerService.registerPhoneNum(requestBody: requestBody).then((value) {
      if (value) {
        closeLoadingDialog();
        startTimer();
        Get.toNamed(AppRoutes.verifyOtpScreen);
      }else{
        closeLoadingDialog();
      }
    });
  }
  void verifyOtp(){
    var requestBody = {
      "mobile": phone.text.toString(),
      "otp": otp.text.toString(),
    };
    _registerService.verifyOtp(requestBody: requestBody).then((value) {
      if (value) {
        closeLoadingDialog();
        Get.toNamed(AppRoutes.signUpScreen);
      }else{
        closeLoadingDialog();
      }
    });
  }
  void registerUser(){
    var requestBody = {
      "mobile": phone.text,
      "FirstName": firstName.text,
      "MiddleName": middleName.text,
      "LastName": lastName.text,
      "Email":  email.text,
      "password": password.text
    };
    _registerService.registerUser(requestBody: requestBody).then((value) {
      if (value) {
        closeLoadingDialog();
        clearSignUpForm();
        Get.offNamed(AppRoutes.registerSuccessScreen);
      }else{
        closeLoadingDialog();
      }
    });
  }
  void clearSignUpForm(){
    phone.clear();
    firstName.clear();
    middleName.clear();
    lastName.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }
}
