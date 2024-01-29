import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/formValidator.dart';
import 'package:ramad_pay/app_basics/text_field.dart';
import 'package:ramad_pay/auth/sign_up_controller.dart';
import '../app_basics/colors.dart';
import '../app_basics/images.dart';


class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
   SignupScreen({Key? key}) : super(key: key);
  final controller = Get.find<SignUpController>();
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
                  "Enter your details to continue",
                  style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      color: accentColor4,
                    ),
                ),
              ),
              const SizedBox(height: 8),
              AppTextField(
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter your first name";
                  }
                },
                hintText: "First Name",
                labelText: "First Name",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                validator: (v){},
                hintText: "Middle Name",
                labelText: "Middle Name",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                validator: (v){

                },
                hintText: "Last Name",
                labelText: "Last Name",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter email address";
                  }else if(FormValidator.validateEmail(v)){
                    return "Please enter valid email";
                  }
                },
                hintText: "Email",
                labelText: "Email",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter password";
                  }else if(FormValidator.passwordValidation(v)){
                    return "Please enter valid email";
                  }
                },
                hintText: "Password",
                labelText: "Password",
                border: true,
              ),

              const SizedBox(height: 16),
              AppTextField(
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please confirm password";
                  }else if(FormValidator.validateEmail(v)){
                    return "Please enter valid email";
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
                    Get.toNamed(AppRoutes.registerSuccessScreen);
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
