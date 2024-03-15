import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import '../app_basics/colors.dart';
import '../helpers/shared_pref_helper.dart';
import '../utils/text_styles.dart';
import '../widgets/add_icon_widget.dart';

class RemittanceScreen extends StatelessWidget {
   RemittanceScreen({super.key});
  final SharedPref _sharedPref = SharedPref();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          AddIconWidget(onTap: () {
            Get.toNamed(AppRoutes.addRemittanceView);
          }),
          const SizedBox(width: 12)
        ],
        backgroundColor: primaryColor.withOpacity(1),
        title: Text("Remittance",
            style: headingTextStyle.copyWith(color: Colors.white)),
      ),
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
                _sharedPref.remove(SharedPref.accessToken);
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
