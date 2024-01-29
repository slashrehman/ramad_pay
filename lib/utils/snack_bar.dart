import 'package:flutter/material.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';

void showSnackBar(String text) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(content: Text(text)));
}