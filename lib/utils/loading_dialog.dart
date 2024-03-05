import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/app_basics/images.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierColor: const Color(0x00ffffff),
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Stack(
                alignment: Alignment.center,
              children: [
                SvgPicture.asset(logoPath, height: 45, width: 45,color: greenShade,),
                const SizedBox(
                    height: 55,
                    width: 55,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    )),
              ],
            ),
        );
      });
}

void closeLoadingDialog(){
  Get.back();
}