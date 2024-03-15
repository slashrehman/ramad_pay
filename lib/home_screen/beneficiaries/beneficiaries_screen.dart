import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_routes.dart';
import 'package:ramad_pay/app_basics/colors.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/utils/snack_bar.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import 'package:ramad_pay/widgets/add_icon_widget.dart';
import 'package:ramad_pay/widgets/profile_avatar.dart';
import '../../utils/beneficiaries_details_widget.dart';
import 'beneficiaries_controller.dart';

class BeneficiariesScreen extends StatelessWidget {
  BeneficiariesScreen({super.key});

  final controller = Get.put(BeneficiariesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          AddIconWidget(onTap: () {
            Get.toNamed(AppRoutes.addBeneficiariesScreen);
          }),
          const SizedBox(width: 12)
        ],
        backgroundColor: primaryColor.withOpacity(1),
        title: Text("Beneficiaries",
            style: headingTextStyle.copyWith(color: Colors.white)),
      ),
      body: controller.obx(
        (state) {
          return ListView.builder(
              itemCount: controller.beneficiaries.data!.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    showBeneficiariesDetails(
                        data: controller.beneficiaries.data![index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 1),
                              color: Colors.grey.withOpacity(.1),
                              blurRadius: 2,
                              spreadRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            buildProfileAvatar(borderRadius: 16),
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text:
                                      "${controller.beneficiaries.data![index].firstName} ${controller.beneficiaries.data![index].middleName} ${controller.beneficiaries.data![index].lastName}",
                                  style: subHeadingTextStyle,
                                  children: [
                                    TextSpan(
                                      text:
                                          "\n${controller.beneficiaries.data![index].mobile}",
                                      style: grey16W500(),
                                    )
                                  ]),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showSnackBar("Click to transfer money");
                              },
                              icon: SvgPicture.asset(
                                sendMoney,
                                height: 28,
                                width: 28,
                                color: greenShade,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
