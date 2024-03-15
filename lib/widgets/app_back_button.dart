import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../app_basics/images.dart';
class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: SvgPicture.asset(backButton),
      ),
    );
  }
}