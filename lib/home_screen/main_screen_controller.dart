import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/home_screen/beneficiaries/beneficiaries_screen.dart';
import 'package:ramad_pay/home_screen/fx_rate_screen.dart';
import 'package:ramad_pay/home_screen/profile/profile_screen.dart';
import 'package:ramad_pay/home_screen/remittance_screen.dart';

class MainScreenController extends GetxController{
  RxInt selectedIndex = 0.obs;
  List<Widget> screens = <Widget>[
    const RemittanceScreen(),
    BeneficiariesScreen(),
     FxRateScreen(),
    // ProfileScreen(),
  ];
}