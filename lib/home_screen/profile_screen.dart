import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/home_screen/profile_controller.dart';
import 'package:get/get.dart';

import '../widgets/profile_tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
   ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: SvgPicture.asset(logoPath),
            ),
            ProfileTile(
              title: "Name",
              value: TextEditingController(text: "Ahmed Shah ABdali"),
              enabled: controller.isEdit.value,
            ),
            ProfileTile(
              title: "Phome",
              value: TextEditingController(text: "+920292929"),
              enabled: controller.isEdit.value,
            ),
          ],
        ),
      ),
    );
  }
}
