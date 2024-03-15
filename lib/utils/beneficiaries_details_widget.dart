import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ramad_pay/utils/rich_text_widget.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:get/get.dart';
import '../app_basics/app_button.dart';
import '../app_basics/app_routes.dart';
import '../model/beneficiaries_model.dart';

void showBeneficiariesDetails({required BeneficiaryData data}) {
  showModalBottomSheet
    (
    context: navigatorKey.currentContext!,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        )
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Beneficiary Details', style: grey16W500(),),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Name",
                value: "${data
                    .firstName} ${data.middleName} ${data.lastName}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Email",
                value: "${data
                    .email}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Mobile Number",
                value: "${data.mobile}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Occupation",
                value: "${data.occupation}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Address",
                value: "${data.address}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Nationality",
                value: "${data.nationality}"
            ),
            const SizedBox(height: 30,),
            AppCustomButton(
              buttonText: "CLOSE",
              onTap: (){
                Get.back();
              },
            ),
            const SizedBox(height: 10,),
          ],
        ),
      );
    },
  );
}