import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_button.dart';
import 'package:ramad_pay/auth/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("User Signed in \n Home Screen"),
            const SizedBox(height: 20),
            AppCustomButton(
              onTap: (){
                Get.offAll(()=> LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
