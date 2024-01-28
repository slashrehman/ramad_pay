import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/service/register_user_service.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phone = TextEditingController();
  TextEditingController promoCode = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController midletName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool hasReferral = false.obs;
  RxBool obscureText = false.obs;
  var country = countries.firstWhere((element) => element.code == 'US');
  RxBool isPhoneNumberValid = false.obs;
  var start = 30.obs;

  void registerMobile() {
    var requestBody = {
      "mobile": phone.text,
      "proCode": promoCode.text.toString(),
    };
    RegisterService().registerPhoneNum(requestBody: requestBody).then((value) {
      if (value) {
        closeLoadingDialog();
        Get.toNamed(AppRoutes.verifyOtpScreen);
      }else{
        closeLoadingDialog();
      }
    });
  }
}
