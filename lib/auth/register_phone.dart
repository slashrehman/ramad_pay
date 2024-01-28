import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/utils/print_console.dart';
import '../app_basics/colors.dart';
import '../utils/loading_dialog.dart';
import 'sign_up_controller.dart';

class PhoneRegister extends StatelessWidget {
   PhoneRegister({Key? key}) : super(key: key);
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(42.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Register new account",
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Poppins',
                ).copyWith(
                  fontFamily: "PoppinsRegular",
                  fontSize: 20.0,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SvgPicture.asset(registerAccount),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter your mobile number \nto continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "PoppinsRegular",
                  fontSize: 16.0,
                  color: accentColor4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                controller: controller.phone,
                initialCountryCode: 'US',
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  contentPadding: EdgeInsets.all(10.0),
                  counterText: "",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                onChanged: (phone) {
                  if (phone.number.length >= controller.country.minLength &&
                      phone.number.length <= controller.country.maxLength) {
                    controller.isPhoneNumberValid.value = true;
                  } else {
                    controller.isPhoneNumberValid.value = false;
                  }

                },
                onCountryChanged: (country) {
                  controller.country  = country;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  controller.hasReferral.value=!controller.hasReferral.value;
                },
                child: const Text(
                  "Do you have a REFERRAL CODE?",
                  style: TextStyle(fontSize: 12.0, color: primaryColor),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(()=> Visibility(
                  visible:controller.hasReferral.value,
                  child: TextField(
                    controller: controller.promoCode,
                    decoration: const InputDecoration(
                      hintText: "Type your referral code...",
                      hintStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: controller.hasReferral.value ? 10: 0.0,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'By singing in you agree to our ',
                      style: const TextStyle(
                        fontSize: 12,
                        color: accentColor4,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of Use',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            printInConsole(data: "${controller.phone.text}");
                              // code to open / launch terms of service link here
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                ()=> SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: (){
                      // Get.toNamed(AppRoutes.verifyOtpScreen);

                      if(controller.isPhoneNumberValid.value){
                        showLoadingDialog(context);
                        controller.registerMobile();
                      }
                      printInConsole(data: "\n ${controller.phone.text}  ${controller.country.dialCode}");
                    },
                    style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize:
                        MaterialStateProperty.all(const Size(double.infinity, 44)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        backgroundColor: controller.isPhoneNumberValid.value
                            ? MaterialStateProperty.all(primaryColor)
                            : MaterialStateProperty.all(accentColor2)),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                          color: controller.isPhoneNumberValid.value ? whiteColor : accentColor4),
                    ),
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
