import 'package:flutter/material.dart';
import '../utils/text_styles.dart';
import '../widgets/list_tile_widget.dart';
import 'package:get/get.dart';
class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.clear, size: 30,),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Account Settings", style: headingTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 24)),
            const Divider(),
            Text("Support".toUpperCase(), style: const TextStyle(letterSpacing: 3.5, fontWeight: FontWeight.bold),),
            const Divider(),
            ListTileWidget(
              title: ("Email our Customer Support team"),
              subtitle: ("Contact Support"),
              onTap: (){},
            ),
            const Divider(),
             ListTileWidget(
              title: "App Version",
              subtitle: "1.0-(3.20.2)",
              onTap: (){},
            ),
            const Divider(),
            ListTileWidget(
              title: "Log out",
              subtitle: "",
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}