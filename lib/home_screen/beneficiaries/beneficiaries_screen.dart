import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_button.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:ramad_pay/utils/utils.dart';
import 'package:ramad_pay/widgets/profile_tile_widget.dart';
import 'beneficiaries_controller.dart';

class BeneficiariesScreen extends StatelessWidget {
   BeneficiariesScreen({super.key});
  final controller = Get.put(BeneficiariesController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(1),
        title: Text("Beneficiaries", style: headingTextStyle.copyWith(color: Colors.white)),
      ),
      body: controller.obx((state) {
        return ListView.builder(
            itemCount: controller.beneficiaries.data!.length,
            itemBuilder: (BuildContext context, index){
          return ExpansionTile(
            backgroundColor: greenShade.withOpacity(.3),
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person_3_rounded),
            ),
            title: Text("${controller.beneficiaries.data![index].firstName} ${controller.beneficiaries.data![index].middleName} ${controller.beneficiaries.data![index].lastName}"),
            subtitle: Text("${controller.beneficiaries.data![index].nationality}, ${controller.beneficiaries.data![index].state}"),
            children: [
              Container(
                padding: EdgeInsets.all(12),
                width: screenWidth -32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: accentColor4.withOpacity(.2),
                  boxShadow: [
                    BoxShadow(offset: Offset(0,2), color: grey400Color.withOpacity(.4),)
                  ]
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Beneficiary Details", style: subHeadingTextStyle)),
                    ProfileTile(title: "Email", value: TextEditingController(text: "${controller.beneficiaries.data![index].email}"), enabled: false),
                    ProfileTile(title: "Phone", value: TextEditingController(text: "${controller.beneficiaries.data![index].mobile}"), enabled: false),
                    ProfileTile(title: "Place of Birth", value: TextEditingController(text: "${controller.beneficiaries.data![index].placeOfBirth}"), enabled: false),
                    ProfileTile(title: "Address", value: TextEditingController(text: "${controller.beneficiaries.data![index].address}"), enabled: false),
                  ],
                ),
              ),
              SizedBox(height: 16,),
            ],
          );
        });
      },
      ),

      bottomSheet: Padding(
        padding: EdgeInsets.all(12),
        child: AppCustomButton(
          onTap: (){
            Get.toNamed(AppRoutes.addBeneficiariesScreen);
          },
          buttonText: "Add New Beneficiary",
        ),),
    );
  }
}
