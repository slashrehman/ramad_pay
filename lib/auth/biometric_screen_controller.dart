import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/helpers/shared_pref_helper.dart';

import '../service/login_service.dart';
import '../utils/loading_dialog.dart';

class BiometricController extends GetxController{
  TextEditingController loginPassword = TextEditingController();
  LocalAuthentication authentication = LocalAuthentication();
  LoginService loginService = LoginService();
  RxString name = ''.obs;
  RxString userName = ''.obs;
  RxBool obscureText = true.obs;
  void callBiometric()async{
    final bool didAuthenticate = await authentication.authenticate(
        options: AuthenticationOptions(stickyAuth: true,  sensitiveTransaction: true),
        localizedReason: 'Please authenticate to show account balance',
        authMessages:  <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ]);
    if(didAuthenticate){
      Get.toNamed(AppRoutes.mainScreen);
    }
  }
  void loginUser(){
    var requestBody =  {
      "UserName": userName.value,
      "password": loginPassword.text.toString()
    };
    loginService.loginUser(requestBody: requestBody).then((value) {
      if(value){
        closeLoadingDialog();
        Get.toNamed(AppRoutes.mainScreen);
        SharedPref.instance.saveString(SharedPref.userName, userName.value);
      }else{
        closeLoadingDialog();
      }
    });
  }
  @override
  void onInit() async{
    name.value = await SharedPref.instance.readString(SharedPref.name);
    userName.value = await SharedPref.instance.readString(SharedPref.userName);
    super.onInit();
  }
}