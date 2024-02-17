import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/home_screen/beneficiaries_screen.dart';
import 'package:ramad_pay/home_screen/fx_rate_screen.dart';
import 'package:ramad_pay/home_screen/profile/profile_screen.dart';
import 'package:ramad_pay/home_screen/remittance_screen.dart';

class MainScreenController extends GetxController{
  RxInt selectedIndex = 0.obs;
  List<Widget> screens = <Widget>[
    BeneficiariesScreen(),
    RemittanceScreen(),
    FxRateScreen(),
    ProfileScreen(),
  ];
}