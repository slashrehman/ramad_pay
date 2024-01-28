import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController{
  TextEditingController phone = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  RxBool obscureText = false.obs;

}