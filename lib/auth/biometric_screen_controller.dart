import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BiometricController extends GetxController{
  TextEditingController loginPassword = TextEditingController();
  LocalAuthentication authentication = LocalAuthentication();
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
        ]).then((value) async{
      print("object $value");
      return value;
    });
  }
  @override
  void onInit() {

    super.onInit();
  }
}