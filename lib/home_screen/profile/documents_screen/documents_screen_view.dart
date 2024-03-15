import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_basics/app_routes.dart';
import '../../../app_basics/colors.dart';
import '../../../utils/document_details_widget.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/add_icon_widget.dart';
import '../../../widgets/app_back_button.dart';
import '../../../widgets/profile_avatar.dart';
import '../../beneficiaries/beneficiaries_screen.dart';
import '../profile_controller.dart';

class ViewDocumentsScreen extends StatelessWidget {
   ViewDocumentsScreen({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text("Documents", style: headingTextStyle),
        actions: [
          AddIconWidget(onTap: () {
            Get.toNamed(AppRoutes.addDocumentsScreen);
          }),
          const SizedBox(width: 12)
        ],
        leading: const AppBackButton(),
        leadingWidth: 35,
      ),
      body: controller.obx((state) {
      return  ListView.builder(
            itemCount: controller.userProfileModel!.data.docs!.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: (){
                  showDocumentDetails(data: controller.userProfileModel!.data.docs![index]);
                  // showBeneficiariesDetails(data: controller.beneficiaries.data![index]);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(2, 1),
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
                          SizedBox(width: 8),
                          RichText(
                            text: TextSpan(
                                text: "${controller.userProfileModel!.data.docs![index].docTypeDesc} ",
                                style: subHeadingTextStyle,
                                children: [
                                  TextSpan(
                                    text: "\n${controller.userProfileModel!.data.docs![index].country}",
                                    style: grey16W500(),
                                  )
                                ]
                            ),
                          ),
                          Spacer(),
                          // IconButton(
                          //   onPressed: (){
                          //     showSnackBar("Click to transfer money");
                          //   },
                          //   icon: SvgPicture.asset(sendMoney, height: 28,
                          //     width: 28,
                          //     color: greenShade,),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              );});
      }),
    );
  }
}
