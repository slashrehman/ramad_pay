import 'package:flutter/material.dart';
import 'package:ramad_pay/app_basics/colors.dart';

BoxDecoration getBoxDecoration(BuildContext context,
    {isPressed = false, borderRadius = 30.0, blurRadius = 6.0}) =>
    BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: isPressed ? const Color(0xFFD7E6F4) : greenShade,
      boxShadow: [
        BoxShadow(
          offset: isPressed ? Offset(-3, -3) : Offset(2, 2),
          color: Colors.black12,
          blurRadius: blurRadius,
        ),
        BoxShadow(
          offset: isPressed ? Offset(3, 3) : Offset(-2, -2),
          color: Colors.white,
          blurRadius: blurRadius,
        ),
      ],
    );