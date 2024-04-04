import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/auth/biometric_screen_controller.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:ramad_pay/widgets/profile_avatar.dart';

import '../app_basics/app_button.dart';
import '../app_basics/colors.dart';
import '../app_basics/formValidator.dart';
import '../app_basics/images.dart';
import '../app_basics/text_field.dart';
import '../utils/loading_dialog.dart';

class VerifyBioMetricScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final biometricController = Get.put(BiometricController());

  VerifyBioMetricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SvgPicture.asset(
                  logoPath,
                  width: 200.0,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Welcome, ${biometricController.name.value}",
              style: TextStyle(
                  fontSize: 24.0, color: greyColor, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Obx(
                    () => AppTextField(
                      textEditingController: biometricController.loginPassword,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Password is empty";
                        } else if (!FormValidator.passwordValidation(value)) {
                          return "Please enter a valid password";
                        }
                      },
                      obscureText: biometricController.obscureText.value,
                      suffixIcon: IconButton(
                          icon: Icon(
                            biometricController.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey[600],
                            size: 28.0,
                          ),
                          onPressed: () {
                            biometricController.obscureText.value =
                                !biometricController.obscureText.value;
                          }),
                      border: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            AppCustomButton(
              onTap: (){
                if(_formKey.currentState!.validate()){
                  showLoadingDialog(context);
                  biometricController.loginUser();
                }
              },
              buttonText: "Login",
            ),
            SizedBox(height: 60,),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.loginScreen);
              },
              child: Row(
                children: [
                  buildProfileAvatar(borderRadius: 100),
                  SizedBox(width: 8,),
                  Text("Switch to another user", style: subHeadingTextStyle.copyWith(color: greenShade),),
                ],
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: (){
                biometricController.callBiometric();
              },
              child: Row(
                children: [
                  Icon(Icons.fingerprint_outlined, size: 50, color: primaryColor,),
                  SizedBox(width: 4,),
                  Text("Fingerprint login", style: subHeadingTextStyle.copyWith(color: greenShade),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
