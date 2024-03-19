import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/home_screen/remittance_screen/remittance_controller.dart';
import '../app_basics/colors.dart';
import '../helpers/shared_pref_helper.dart';
import '../utils/text_styles.dart';
import '../widgets/add_icon_widget.dart';

class RemittanceScreen extends StatelessWidget {
  RemittanceScreen({super.key});

  final SharedPref _sharedPref = SharedPref();
  final controller = Get.put(RemittanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: controller.obx(
        (state) => ListView.builder(
            itemCount: controller.remittanceList.length,
            itemBuilder: (BuildContext context, index){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 1),
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 2,
                      spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // buildProfileAvatar(borderRadius: 16),
                    // SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                          text: "${controller.remittanceList[index].beneficiaryAccountTitle} ",
                          style: subHeadingTextStyle,
                          children: [
                            TextSpan(
                              text: "\n${controller.remittanceList[index].beneficiaryBankName}",
                              style: grey16W500(),
                            )
                          ]
                      ),
                    ),
                    Spacer(),
                    // IconButton(
                    //   onPressed: (){
                    //     showSnackBar("Click to transfer money");
                    //   },
                    //   icon: SvgPicture.asset(sendMoney, height: 28,
                    //     width: 28,
                    //     color: greenShade,),
                    // )
                  ],
                ),
              ],
            ),
          );
        })

        //     Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //      Align(
        //         alignment: Alignment.center,
        //         child: Text(
        //             "${controller.remittanceList[0].sourceOfIncome}\nNote : this is demo screen UI will be updated soon\n \n \n  Logout to Sign in again")),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     // SvgPicture.asset(logoPath),
        //     MaterialButton(
        //         child: Text("Logout"),
        //         onPressed: () {
        //           Get.deleteAll();
        //           _sharedPref.remove(SharedPref.accessToken);
        //           Get.offAllNamed(AppRoutes.loginScreen);
        //         }),
        //     // MaterialButton(
        //     //     child: Text("Add Benficeriy"),
        //     //     onPressed: (){
        //     //       Get.deleteAll();
        //     //       Get.toNamed(AppRoutes.addBeneficiariesScreen);
        //     //     }),
        //   ],
        // ),
      ),
    );
  }
}
