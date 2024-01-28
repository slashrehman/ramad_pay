import '../app_basics/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../utils/utils.dart';

class AppCustomButton extends StatelessWidget {

  Callback? onTap;
  String buttonText;
  AppCustomButton({Key? key, this.onTap, this.buttonText = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: primaryColor,
      height: 50,
      // minWidth: screenWidth - 60,
      child: Text(buttonText, style: const TextStyle(color:whiteColor)),
    );
  }
}
