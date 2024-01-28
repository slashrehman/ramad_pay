import 'package:flutter/cupertino.dart';

SizedBox verticalSpacing({int count = 1}){
  return SizedBox(height: (10 * count).toDouble());
}

SizedBox horizontalSpacing({int count = 1}){
  return SizedBox(width: (10 * count).toDouble());
}