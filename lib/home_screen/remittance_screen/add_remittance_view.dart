import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/home_screen/remittance_screen/remittance_controller.dart';
import '../../app_basics/colors.dart';
import '../../utils/text_styles.dart';
import '../../widgets/app_back_button.dart';
import '../profile/documents_screen/add_documents_screen.dart';

class AddRemittanceView extends StatelessWidget {
  AddRemittanceView({super.key});
  final controller = Get.put(RemittanceController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
       elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor.withOpacity(1),
        title: Text("Add Remittance",
            style: headingTextStyle.copyWith(color: Colors.white)),
       leading: const AppBackButton(),
       leadingWidth: 35,
      ),
      body: controller.obx(
        (child)=> SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CustomDropDown(
                onSelected: (value) {
                  // controller.selectedDocument = value;
                  // controller.image = File('');
                  // controller.imagePath('');
                  // controller.fileTitle.value = '${value.value} Image';
                },
                list: controller.beneficiariesList.value,
                title: "Beneficiary",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
