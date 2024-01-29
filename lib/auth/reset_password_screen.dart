import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../app_basics/colors.dart';
import '../app_basics/formValidator.dart';
import '../app_basics/images.dart';
import '../app_basics/text_field.dart';
import '../utils/loading_dialog.dart';
import 'login/login_controller.dart';
class ResetPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final controller  = Get.find<LoginController>();
   ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(registerAccount),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your details to reset your Password",
                  style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 16.0,
                    color: accentColor4,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              AppTextField(
                textEditingController: controller.userName,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter your first name";
                  }
                },
                hintText: "User name",
                labelText: "User name",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.otp,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter OTP";
                  }else if(v.toString().length < 6){
                    return "OTP is Six digit";
                  }
                },
                hintText: "OTP",
                labelText: "OTP",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.password,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter password";
                  }else if(!FormValidator.passwordValidation(v)){
                    return "Please enter valid password";
                  }
                },
                hintText: "Password",
                labelText: "Password",
                border: true,
              ),

              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.confirmPassword,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter confirm password";
                  }else if(!FormValidator.passwordValidation(v)){
                    return "Please enter valid email";
                  }else if(v.toString() != controller.password.text){
                    return "Confirm Password didn't match password";
                  }
                },
                hintText: "Confirm Password",
                labelText: "Confirm Password",
                border: true,
              ),
              const Text(
                "At least 8 characters including a capital letter a special character and a number",
                style: TextStyle(color: Colors.green, fontSize: 12.0),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Your email will be used as your login username and to recover your password.",
                textAlign: TextAlign.center,
                style: TextStyle(color: accentColor4, fontSize: 12.0),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    showLoadingDialog(context);
                    controller.sendRestPasswordOTPEmail();
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: whiteColor,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.blue[900],
                  minimumSize: const Size(300, 50),
                ),
                child: Text("Next".toUpperCase()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
