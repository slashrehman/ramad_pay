import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/text_field.dart';
import 'package:ramad_pay/auth/sign_up_controller.dart';

import '../app_basics/colors.dart';
import '../app_basics/formValidator.dart';

class PasswordResetScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  PasswordResetScreen({Key? key}) : super(key: key);
  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: [
                  Text(
                    'recovery_password',
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
              // customTextLabel(
              //   label: 'input_enter_your_email',
              //   fontSize: 17,
              //   color: accentColor4,
              // ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: AppTextField(
                  textEditingController: controller.recoveryEmail,
                  hintText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!FormValidator.validateEmail(value)) {
                      return 'Please enter valid email';
                    }
                    return null;
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
