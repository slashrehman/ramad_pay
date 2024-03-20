import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';
import 'package:ramad_pay/utils/activity_button.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:ramad_pay/widgets/profile_avatar.dart';
import '../utils/category_card.dart';

class HomeScreenView extends StatelessWidget {
   HomeScreenView({super.key});
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: controller.obx(
        (state)=> Stack(
          children: [
            Positioned(
              top: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  // image: DecorationImage(
                  //   image:
                  // ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40,),
                      Text("Good Morning,", style: subHeadingTextStyle.copyWith(color: whiteColor.withOpacity(.5),)),
                      const SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${controller.firstName!.text.toString()}", style: headingTextStyle.copyWith(color: whiteColor),),
                          GestureDetector(
                              onTap: (){
                                Get.toNamed(AppRoutes.profileScreen,);
                              },
                              child: buildProfileAvatar(borderRadius: 100)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/3 - 110,
              right: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width -MediaQuery.of(context).size.width/5 ,
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 8,
                        spreadRadius: 5)
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    topLeft: Radius.circular(4),
                  )
                ),
                child:  Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            icon: const Icon(Icons.keyboard_double_arrow_up, color: primaryColor,),
                            label: RichText(
                              text: TextSpan(
                                text: "Balance",
                                style: grey14W500(),
                                children: [
                                  TextSpan(
                                    text: "\n\$2000.00",
                                    style: subHeadingTextStyle
                                  )
                                ]
                              ),
                            ),
                            onPressed: (){},
                          ),
                          SizedBox(width: 16),
                          const VerticalDivider(color: grey400Color, indent: 8, endIndent: 8, width: 2.0,),
                          SizedBox(width: 16,),
                          TextButton.icon(
                            icon: const Icon(Icons.keyboard_double_arrow_down, color: Colors.redAccent,),
                            label: RichText(
                              text: TextSpan(
                                  text: "History",
                                  style: grey14W500(),
                                  children: [
                                    TextSpan(
                                        text: "\n\$1890.00",
                                        style: subHeadingTextStyle
                                    )
                                  ]
                              ),
                            ),
                            onPressed: (){},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("You Spent \$1494.5 this month\n Let's see cost statistics for this period", style: grey14W500(),)),
                    const SizedBox(height: 4,),
                    const Divider(indent: 8, color: grey400Color,),
                    const SizedBox(height: 4,),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text("View Details", style: primaryColor14W500(),))
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/3 + 75,
              // left: 20,
              // right: 20,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Activity", style: black16W600),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        buildActivityButton(Icons.credit_card, "My Card",
                            Colors.blue.withOpacity(0.2), const Color(0XFF01579B)),
                        buildActivityButton(
                            Icons.transfer_within_a_station,
                            "Send money",
                            Colors.cyanAccent.withOpacity(0.2),
                            const Color(0XFF0097A7)),
                        buildActivityButton(
                            Icons.bar_chart,
                            "  Transaction\n  Status",
                            const Color(0XFFD7CCC8).withOpacity(0.4),
                            const Color(0XFF9499B7)),
                      ],
                    ),
                    const SizedBox(height: 8),
                     Text(
                      "Categories",
                      style: black16W600,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildCategoryCard(Icons.fastfood, "Sent", 120, 20),
                    buildCategoryCard(Icons.flash_on, "Status of Transfers", 430, 17),
                    // buildCategoryCard(Icons.flash_on, "Utilities", 430, 17),
                    // buildCategoryCard(Icons.flash_on, "Utilities", 430, 17),
                    // buildCategoryCard(Icons.flash_on, "Utilities", 430, 17),
                    // buildCategoryCard(Icons.flash_on, "Utilities", 430, 17),
                    // buildCategoryCard(Icons.fastfood, "Food", 120, 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}