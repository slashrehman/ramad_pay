import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/home_screen/beneficiaries/beneficiaries_screen.dart';
import 'package:ramad_pay/home_screen/remittance_screen.dart';
import 'package:ramad_pay/home_screen/home_screen_view.dart';

class MainScreenController extends GetxController{
  RxInt selectedIndex = 0.obs;
  List<Widget> screens = <Widget>[
     HomeScreenView(),
    BeneficiariesScreen(),
     RemittanceScreen(),
    // ProfileScreen(),
  ];
}