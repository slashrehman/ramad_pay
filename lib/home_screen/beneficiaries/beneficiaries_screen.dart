import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_button.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/model/beneficiaries_model.dart';
import 'package:ramad_pay/utils/snack_bar.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:ramad_pay/utils/utils.dart';
import 'package:ramad_pay/widgets/add_icon_widget.dart';
import 'package:ramad_pay/widgets/box_decoration.dart';
import 'package:ramad_pay/widgets/profile_avatar.dart';
import 'package:ramad_pay/widgets/profile_tile_widget.dart';
import 'beneficiaries_controller.dart';

class BeneficiariesScreen extends StatelessWidget {
  BeneficiariesScreen({super.key});

  final controller = Get.put(BeneficiariesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          AddIconWidget(onTap: () {
            Get.toNamed(AppRoutes.addBeneficiariesScreen);
          }),
          SizedBox(width: 12)
        ],
        backgroundColor: primaryColor.withOpacity(1),
        title: Text("Beneficiaries",
            style: headingTextStyle.copyWith(color: Colors.white)),
      ),
      body: controller.obx(
            (state) {
          return ListView.builder(
              itemCount: controller.beneficiaries.data!.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: (){
                    showBeneficiariesDetails(data: controller.beneficiaries.data![index]);
                  },
                  child: Container(
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
                            buildProfileAvatar(borderRadius: 16),
                            SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text: "${controller.beneficiaries.data![index]
                                      .firstName} ${controller.beneficiaries
                                      .data![index].middleName} ${controller
                                      .beneficiaries.data![index].lastName}",
                                  style: subHeadingTextStyle,
                                  children: [
                                    TextSpan(
                                      text: "\n${controller.beneficiaries
                                          .data![index].mobile}",
                                      style: grey16W500(),
                                    )
                                  ]
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: (){
                                showSnackBar("Click to transfer money");
                              },
                              icon: SvgPicture.asset(sendMoney, height: 28,
                                width: 28,
                                color: greenShade,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
                ///old UI committed
                // return ExpansionTile(
                //   backgroundColor: greenShade.withOpacity(.3),
                //   leading: CircleAvatar(
                //     backgroundColor: Colors.blueGrey,
                //     child: Icon(Icons.person_3_rounded),
                //   ),
                //   title: Text("${controller.beneficiaries.data![index].firstName} ${controller.beneficiaries.data![index].middleName} ${controller.beneficiaries.data![index].lastName}"),
                //   subtitle: Text("${controller.beneficiaries.data![index].nationality}, ${controller.beneficiaries.data![index].state}"),
                //   children: [
                //     Container(
                //       padding: EdgeInsets.all(12),
                //       width: screenWidth -32,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(12),
                //         color: accentColor4.withOpacity(.2),
                //         boxShadow: [
                //           BoxShadow(offset: Offset(0,2), color: grey400Color.withOpacity(.4),)
                //         ]
                //       ),
                //       child: Column(
                //         children: [
                //           Align(
                //               alignment: Alignment.centerLeft,
                //               child: Text("Beneficiary Details", style: subHeadingTextStyle)),
                //           ProfileTile(title: "Email", value: TextEditingController(text: "${controller.beneficiaries.data![index].email}"), enabled: false),
                //           ProfileTile(title: "Phone", value: TextEditingController(text: "${controller.beneficiaries.data![index].mobile}"), enabled: false),
                //           ProfileTile(title: "Place of Birth", value: TextEditingController(text: "${controller.beneficiaries.data![index].placeOfBirth}"), enabled: false),
                //           ProfileTile(title: "Address", value: TextEditingController(text: "${controller.beneficiaries.data![index].address}"), enabled: false),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 16,),
                //   ],
                // );
              });
        },
      ),

      // bottomSheet: Padding(
      //   padding: EdgeInsets.all(12),
      //   child: AppCustomButton(
      //     onTap: (){
      //
      //     },
      //     buttonText: "Add New Beneficiary",
      //   ),),
    );
  }
}

void showBeneficiariesDetails({required BeneficiaryData data}) {
  showModalBottomSheet
    (
    context: navigatorKey.currentContext!,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      )
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Beneficiary Details', style: grey16W500(),),
            SizedBox(height: 12),
            richTextWidget(
              title: "Name",
              value: "${data
                  .firstName} ${data.middleName} ${data.lastName}"
            ),
            SizedBox(height: 12),
            richTextWidget(
                title: "Email",
                value: "${data
                    .email}"
            ),
            SizedBox(height: 12),
            richTextWidget(
                title: "Mobile Number",
                value: "${data.mobile}"
            ),
            SizedBox(height: 12),
            richTextWidget(
                title: "Occupation",
                value: "${data.occupation}"
            ),
            SizedBox(height: 12),
            richTextWidget(
                title: "Address",
                value: "${data.address}"
            ),
            SizedBox(height: 12),
            richTextWidget(
                title: "Nationality",
                value: "${data.nationality}"
            ),
            SizedBox(height: 30,),
            AppCustomButton(
              buttonText: "CLOSE",
              onTap: (){
                Get.back();
              },
            ),
            SizedBox(height: 10,),
          ],
        ),
      );
    },
  );
}

RichText richTextWidget({String? title, String? value}) {
  return RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: "$title\n",
                style: grey12W500()
              ),
              TextSpan(
                text: "$value",
                style: black16W600
              ),
            ]
          ));
}