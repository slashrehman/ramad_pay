import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/text_field.dart';
import 'package:ramad_pay/auth/login/login_controller.dart';
import 'package:ramad_pay/auth/sign_up_controller.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';

import '../app_basics/colors.dart';
import '../app_basics/formValidator.dart';

class PasswordResetScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  PasswordResetScreen({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height:60),
              const Row(
                children: [
                  Text(
                    'Recovery Password',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Enter your email',
                style: TextStyle(
                  fontSize: 17,
                  color: accentColor4,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: AppTextField(
                  border: true,
                  textEditingController: controller.email,
                  hintText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!FormValidator.validateEmail(value)) {
                      return 'Please enter valid email';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
          color: Colors.blue[900],
          child: InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                showLoadingDialog(context);
                controller.sendRestPasswordOTPEmail();
              }
            },
            child: SizedBox(
              height: 50.0,
              width: double.infinity,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.lock_outline,
                        color: whiteColor,
                        size: 22.0,
                      ),
                    ),
                    Text(
                      "Submit".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 0.0,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
