import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';

class FxRateScreen extends StatelessWidget {
  const FxRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
              alignment: Alignment.center,
              child: Text("Note : this is demo screen UI will be updated soon\n \n \n  Logout to Sign in again")),
          SizedBox(height: 20,),
          // SvgPicture.asset(logoPath),
          MaterialButton(
              child: Text("Logout"),
              onPressed: (){
                Get.deleteAll();
                Get.offAllNamed(AppRoutes.loginScreen);
              }),
          // MaterialButton(
          //     child: Text("Add Benficeriy"),
          //     onPressed: (){
          //       Get.deleteAll();
          //       Get.toNamed(AppRoutes.addBeneficiariesScreen);
          //     }),
        ],
      ),
    );
  }
}
