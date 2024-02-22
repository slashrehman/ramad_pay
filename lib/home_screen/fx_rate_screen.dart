import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';

class FxRateScreen extends StatelessWidget {
  const FxRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Text("Note : this is demo screen UI will be updated soon\n \n \n  Logout to Signin Agian")),
          SizedBox(height: 20,),
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
