import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            shadowColor: Colors.white,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        );
      });
}

void closeLoadingDialog(){
  Get.back();
}