import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';

class FxRateScreen extends StatelessWidget {
  const FxRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(

        child: MaterialButton(
            child: Text("Logout"),
            onPressed: (){
              Get.deleteAll();
              Get.offAllNamed(AppRoutes.loginScreen);
            }),

      ),
    );
  }
}
