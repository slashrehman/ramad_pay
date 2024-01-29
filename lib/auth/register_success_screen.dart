import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_basics/app_routes.dart';
import '../app_basics/colors.dart';
import '../app_basics/images.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            SvgPicture.asset(
              doneIcon,
              width: 140,
              height: 140,
              color: Colors.green,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Your account has been \n created successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20.0,
                color: accentColor4,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextButton(
                onPressed: (){
                  Get.offNamed(AppRoutes.loginScreen);
                },
                style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 44)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    backgroundColor: MaterialStateProperty.all(primaryColor)),
                child: Text(
                  "Ok".toUpperCase(),
                  style: const TextStyle(color: whiteColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
