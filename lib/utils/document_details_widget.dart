
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ramad_pay/model/user_profile_model.dart';
import 'package:ramad_pay/utils/rich_text_widget.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:get/get.dart';
import '../app_basics/app_button.dart';
import '../app_basics/app_routes.dart';

void showDocumentDetails({required Doc data}) {
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
            Text('Document Details', style: grey16W500(),),
            const SizedBox(height: 24),
            richTextWidget(
                title: "Document",
                value: "${data.orgName}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Type",
                value: "${data.docTypeDesc}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Document Country",
                value: "${data.country}"
            ),
            const SizedBox(height: 12),
            richTextWidget(
                title: "Expiry Date",
                value: "${data.expiryDate.toString().split(" ").first}"
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