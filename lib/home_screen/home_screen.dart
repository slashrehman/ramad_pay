import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_button.dart';

import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true); // if true allow back else block it
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("User Signed in \n Home Screen"),
            const SizedBox(height: 20),
            AppCustomButton(
              buttonText: "Logout",
              onTap: (){
                controller.getCountries();
                // Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
