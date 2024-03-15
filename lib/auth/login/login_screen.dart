import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_button.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/text_field.dart';
import 'package:ramad_pay/auth/login/login_controller.dart';
import 'package:ramad_pay/auth/register_phone.dart';
import 'package:ramad_pay/auth/sign_up_controller.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';
import '../../app_basics/colors.dart';
import '../../app_basics/formValidator.dart';
import '../../app_basics/images.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());
  final signupController = Get.put(SignUpController());
 final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SvgPicture.asset(
                logoPath,
                width: 200.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    border: true,
                    hintText: "Email or Mobile Number",
                    textEditingController: loginController.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username or mobile number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    ()=> AppTextField(
                      textEditingController: loginController.loginPassword,
                      validator: (value){
                        if(value.toString().isEmpty){
                         return "Password is empty";
                        }else if(!FormValidator.passwordValidation(value)){
                          return "Please enter a valid password";
                        }
                      },
                      obscureText: loginController.obscureText.value,
                      suffixIcon: IconButton(
                          icon: Icon(
                              loginController.obscureText.value?
                              Icons.visibility : Icons.visibility_off,
                            color: Colors.grey[600],
                            size: 28.0,
                          ),
                          onPressed: (){
                            loginController.obscureText.value= !loginController.obscureText.value;
                          }),
                      border: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.passwordRecoveryScreen);
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
            AppCustomButton(
              onTap: (){
                if(_formKey.currentState!.validate()){
                  showLoadingDialog(context);
                  loginController.loginUser();
                }
              },
              buttonText: "Login",
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primaryColor,
                  ),
                  child: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      "Register new account",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhoneRegister(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: Material(
      //   color: primaryColor,
      //   child: InkWell(
      //     onTap: () {
      //       if(_formKey.currentState!.validate()){
      //         showLoadingDialog(context);
      //         loginController.loginUser();
      //       }
      //     },
      //     child: const SizedBox(
      //       height: 50.0,
      //       width: double.infinity,
      //       child: Center(
      //         child: Text(
      //           "Log In",
      //           style: TextStyle(color: Colors.white, fontSize: 18.0),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}