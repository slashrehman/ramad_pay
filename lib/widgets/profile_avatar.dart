import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramad_pay/app_basics/images.dart';

import '../app_basics/colors.dart';

Container buildProfileAvatar({required double borderRadius}) => Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(color: whiteColor, width: 1.0),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 4,
              color: Colors.black.withOpacity(.1)),
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 4,
              color: Colors.black.withOpacity(.1)),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
        // color: greenShade.withOpacity(.5),
      ),
      child: SvgPicture.asset(accountIcon),
    );
