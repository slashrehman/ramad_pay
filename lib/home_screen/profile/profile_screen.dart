
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramad_pay/app_basics/app_button.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/utils/text_styles.dart';

import '../../widgets/profile_tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
   ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("Profile", style: headingTextStyle),
        actions: [
          IconButton(
              onPressed: (){
                controller.loadEditProfileData();
                Get.toNamed(AppRoutes.editProfileScreen);
              },
              icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: controller.obx(
        (state)=> Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: SvgPicture.asset(logoPath),
              ),
              ProfileTile(
                title: "Name",
                value: controller.name!,
                enabled: controller.isEdit.value,
              ),
              ProfileTile(
                title: "Phome",
                value: controller.phone!,
                enabled: controller.isEdit.value,
              ),
              ProfileTile(
                title: "Email",
                value: controller.email!,
                enabled: controller.isEdit.value,
              ),

             const SizedBox(height: 100,),
              AppCustomButton(
                buttonText: "Add Documents",
                onTap: (){
                  Get.toNamed(AppRoutes.addDocumentsScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
