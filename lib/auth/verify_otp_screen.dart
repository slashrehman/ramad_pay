import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:ramad_pay/auth/sign_up_controller.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';
import '../app_basics/colors.dart';
import '../utils/common_theme.dart';

class VerifyOTPScreen extends StatelessWidget {
   VerifyOTPScreen({Key? key}) : super(key: key);
  final controller = Get.find<SignUpController>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Register new account",
                  style: GoogleFonts.getFont(
                    'Montserrat',
                  ).copyWith(
                    fontFamily: "PoppinsRegular",
                    fontSize: 28.0,
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Please enter the 6 digit code \n we sent to ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "PoppinsRegular",
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                controller: controller.otp,
                androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                validator: (value) {
                  return value?.length == 6 ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {},
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IgnorePointer(
                    ignoring: controller.start > 0,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Text(
                        'Resend Code',
                        style: GoogleFonts.getFont('Poppins').copyWith(
                          color: controller.start > 0 ? Colors.black54 : primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.250666666,
                  ),
                  Text(
                    controller.start > 0 ? '00:${controller.start}' : "",
                    style: GoogleFonts.getFont('Poppins').copyWith(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 16,),
              Text.rich(
                TextSpan(
                  text: '',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Still haven\'t received the code?',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // code to open / launch terms of service link here
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: (){
                  //back
                  // Get.back();
                  if(_key.currentState!.validate()){
                    showLoadingDialog(context);
                    controller.verifyOtp();
                  }

                },
                style: TextButton.styleFrom(
                  foregroundColor: whiteColor,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.blue[900],
                  minimumSize: const Size(300, 50),
                ),
                child: Text("Back".toUpperCase()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
