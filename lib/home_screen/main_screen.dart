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
          // extendBody: true,
          // extendBodyBehindAppBar: true,
          body: value.screens[value.selectedIndex.value],
          // bottomNavigationBar: Container(
          //   clipBehavior: Clip.hardEdge,
          //   decoration:  BoxDecoration(
          //     boxShadow: [
          //       BoxShadow(offset: Offset(4, 4), color: primaryColor.withOpacity(.1)),
          //       BoxShadow(offset: Offset(-3, -3), color: primaryColor.withOpacity(.1))
          //     ],
          //     borderRadius: BorderRadius.circular(
          //     32
          //     ),
          //   ),
          //   margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          //   child: BottomNavigationBar(
          //       showSelectedLabels: true,
          //       // backgroundColor: Colors.white,
          //       type: BottomNavigationBarType.fixed,
          //       showUnselectedLabels: true,
          //       selectedLabelStyle: const TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
          //       unselectedLabelStyle:  TextStyle(color: grey400Color, fontWeight: FontWeight.w500),
          //       currentIndex: controller.selectedIndex.value,
          //       onTap: (value) {
          //         controller.selectedIndex.value = value;
          //         controller.update();
          //       },
          //       iconSize: 25,
          //       selectedItemColor: primaryColor,
          //       unselectedItemColor: grey400Color,
          //       selectedIconTheme: const IconThemeData(
          //         size: 30, fill: 1
          //       ),
          //       items: [
          //         const BottomNavigationBarItem(
          //             icon: Icon(
          //               Icons.home_outlined,
          //             ),
          //             activeIcon: Icon(Icons.home_filled),
          //             label: "Home"),
          //         BottomNavigationBarItem(
          //             icon: SvgPicture.asset(
          //               logoPath,
          //               height: 32,
          //               color: grey400Color,
          //             ),
          //             activeIcon: SvgPicture.asset(
          //               logoPath,
          //               height: 32,
          //             ),
          //             label: "Beneficiaries"),
          //         const BottomNavigationBarItem(
          //             icon: Icon(
          //               Icons.radar,
          //             ),
          //             label: "Fx Rate"),
          //       ]),
          //
          // ),
          bottomNavigationBar: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 5,
                    spreadRadius: 3)
              ],
              borderRadius: BorderRadius.circular(32),
            ),
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: NavigationBar(
              height: 60,
              backgroundColor: Colors.white,
              selectedIndex: controller.selectedIndex.value,
              indicatorColor: greenShade,
              shadowColor: Colors.pink,
              elevation: 22,
              indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onDestinationSelected: (value) {
                controller.selectedIndex.value = value;
                controller.update();
              },
              destinations: [
                const NavigationDestination(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    selectedIcon: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    label: "Home"),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    logoPath,
                    height: 32,
                  ),
                  selectedIcon: SvgPicture.asset(
                    logoPath,
                    height: 32,
                    color: Colors.white,
                  ),
                  label: "Beneficiaries",
                ),
                //             label: "Beneficiaries"),
                const NavigationDestination(
                    icon: Icon(
                      Icons.radar,
                    ),
                    selectedIcon: Icon(
                      Icons.radar,
                      color: Colors.white,
                    ),
                    label: "Remittance"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
