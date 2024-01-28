import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';

import '../app_basics/colors.dart';
final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
    fontSize: 22,
    color: Color.fromRGBO(30, 60, 87, 1),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: borderColor),
  ),
);