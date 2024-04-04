import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/home_screen/remittance_screen/remittance_controller.dart';
import 'package:ramad_pay/utils/utils.dart';
import '../app_basics/colors.dart';
import '../helpers/shared_pref_helper.dart';
import '../utils/text_styles.dart';
import '../widgets/add_icon_widget.dart';

class RemittanceScreen extends StatelessWidget {
  RemittanceScreen({super.key});
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
                          text: "Ben Name \n",
                          style: grey12W500(),
                          // style: subHeadingTextStyle,
                          children: [
                            TextSpan(
                              text: "${controller.remittanceList[index].benName}",
                              style: black14W700,
                            )
                          ]
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                          text: "Payout Currency \n",
                          style: grey12W500(),
                          // style: subHeadingTextStyle,
                          children: [
                            TextSpan(
                              text: "${controller.remittanceList[index].payoutCurrency}",
                              style: black14W700,
                            )
                          ]
                      ),
                    ),
                  ],
                ),
                widgetVerticalPadding,
                Row(
                  children: [
                    // buildProfileAvatar(borderRadius: 16),
                    // SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                          text: "Ben Country \n",
                          style: grey12W500(),
                          // style: subHeadingTextStyle,
                          children: [
                            TextSpan(
                              text: "${controller.remittanceList[index].country}",
                              style: black14W700,
                            )
                          ]
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                          text: "Transaction Id     \n",
                          style: grey12W500(),
                          // style: subHeadingTextStyle,
                          children: [
                            TextSpan(
                              text: "${controller.remittanceList[index].transId}",
                              style: black14W700,
                            )
                          ]
                      ),
                    ),
                  ],
                ),
                widgetVerticalPadding,
                Row(
                  children: [
                    // buildProfileAvatar(borderRadius: 16),
                    // SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                          text: "Pay out Amount \n",
                          style: grey12W500(),
                          // style: subHeadingTextStyle,
                          children: [
                            TextSpan(
                              text: "${controller.remittanceList[index].payoutAmount}",
                              style: black14W700,
                            )
                          ]
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                          text: "Total Amount      \n",
                          style: grey12W500(),
                          // style: subHeadingTextStyle,
                          children: [
                            TextSpan(
                              text: "${controller.remittanceList[index].amount}",
                              style: black14W700,
                            )
                          ]
                      ),
                    ),
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
