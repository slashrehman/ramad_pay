import 'package:flutter/foundation.dart';

void printInConsole({required String data}){
  if(kDebugMode){
    print(data);
  }
}