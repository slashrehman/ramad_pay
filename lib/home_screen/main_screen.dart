import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/home_screen/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true); // if true allow back else block it
      },
      child: GetBuilder(
        init: MainScreenController(),
        builder: (value) => Scaffold(
          body: value.screens[value.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
              // selectedItemColor: primaryColor,
              // backgroundColor: Colors.yellow,
              useLegacyColorScheme: false,
              // selectedIconTheme: const IconThemeData(
              //   color: Colors.black,
              //   size: 36
              // ),
              showSelectedLabels: false,
              backgroundColor: primaryColor,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(color: Colors.green),
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              currentIndex: controller.selectedIndex.value,
              onTap: (value) {
                controller.selectedIndex.value = value;
                controller.update();
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: grey400Color,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      logoPath,
                      color: grey400Color,
                      height: 32,
                    ),
                    label: "a"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.offline_bolt,
                    ),
                    label: "b"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.radar,
                    ),
                    label: "c"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: "d"),
              ]),
        ),
      ),
    );
  }
}
