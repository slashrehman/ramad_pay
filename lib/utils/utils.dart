import '../app_basics/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
double appBarElevation = 0.0;
final screenWidth = MediaQuery.of(navigatorKey.currentContext!).size.width;
final screenHeight = MediaQuery.of(navigatorKey.currentContext!).size.height;


String getImageSize(File filePath){
  final fileSizeInBytes = filePath.lengthSync();
  final fileSizeInKB = fileSizeInBytes / 1024;

  String sizeOfFile = fileSizeInKB.toStringAsFixed(0);
  return sizeOfFile;
}