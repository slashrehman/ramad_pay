import 'package:flutter/material.dart';
import 'package:ramad_pay/app_basics/app_button.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:ramad_pay/utils/utils.dart';
import 'package:ramad_pay/widgets/profile_avatar.dart';

import '../../helpers/shared_pref_helper.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/profile_tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  final SharedPref _sharedPref = SharedPref();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text("Profile", style: headingTextStyle),
        actions: [
          IconButton(
              onPressed: () {
                controller.loadEditProfileData();
                Get.toNamed(AppRoutes.editProfileScreen);
              },
              icon: const Icon(Icons.edit_rounded)),
          IconButton(
              onPressed: () {
                Get.deleteAll();
                _sharedPref.remove(SharedPref.accessToken);
                Get.offAllNamed(AppRoutes.loginScreen);
              },
              icon: const Icon(Icons.logout_outlined, semanticLabel: "Logout",))
        ],
        leading: const AppBackButton(),
        leadingWidth: 35,
      ),
      body: controller.obx(
        (state)=> Stack(
          children: [
            Positioned(
              top: 0.0,
              child: Container(
                height: screenHeight / 9,
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
              ),
            ),
            Positioned(
              top: screenHeight / 9 - 30,
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 72),
                width: screenWidth,
                height: screenHeight - screenHeight / 9 + 20,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 5,
                        color: Colors.black.withOpacity(.1),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    )),
                child: Column(
                  children: [
                    Container(
                      //
                      width: screenWidth - 32,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 2,
                                spreadRadius: 3)
                          ]),
                      child: Column(
                        children: [
                          ProfileTile(
                            title: "Name",
                            value: controller.name!,
                            enabled: controller.isEdit.value,
                          ),
                          const Divider(color: primaryColor, indent: 8, endIndent: 8,),
                          ProfileTile(
                            title: "Email",
                            value: controller.email!,
                            enabled: controller.isEdit.value,
                          ),
                          const Divider(color: primaryColor, indent: 8, endIndent: 8,),
                          ProfileTile(
                            title: "Country",
                            value: controller.country!,
                            enabled: controller.isEdit.value,
                          ),
                          const Divider(color: primaryColor, indent: 8, endIndent: 8,),
                          ProfileTile(
                            title: "Phone",
                            value: controller.phone!,
                            enabled: controller.isEdit.value,
                          ),
                          // const Divider(color: primaryColor, indent: 8, endIndent: 8,),
                          // ProfileTile(
                          //   title: "Country",
                          //   value: TextEditingController(text: "AhmedAli AKbar Dadu wala"),
                          //   enabled: controller.isEdit.value,
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: screenHeight / 9 - 60,
                child: Align(
                    child: buildProfileAvatar(
                        borderRadius: 100, height: 80, width: 80)))
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 24),
        child: AppCustomButton(buttonText: "View Documents",onTap: (){
          Get.toNamed(AppRoutes.documentsScreen);
        },),
      ),
    );
  }
}
