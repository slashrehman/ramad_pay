import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/app_button.dart';
import 'package:ramad_pay/app_basics/text_field.dart';
import 'package:ramad_pay/model/basic_list_model.dart';
import '../../../app_basics/colors.dart';
import '../../../app_basics/images.dart';
import '../../../utils/loading_dialog.dart';
import '../../../utils/text_styles.dart';
import '../../../widgets/app_back_button.dart';
import '../../../widgets/custom_drop_down.dart';
import '../documents_screen/add_documents_controller.dart';

class AddDocumentsScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(AddDocumentsController());

  AddDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text("Add Documents", style: headingTextStyle),
        leading: const AppBackButton(),
        leadingWidth: 35,
      ),
      body: controller.obx(
        (state) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  CustomDropDown(
                      onSelected: (value) {
                    controller.selectedDocument = value;
                    controller.image = File('');
                    controller.imagePath('');
                    controller.fileTitle.value = '${value.value} Image';
                  },
                    list: controller.documentsTypesList.value,
                    title: "Document Type",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.chooseImageSourceDialog();
                    },
                    child: Obx(
                      () => ListTile(
                        tileColor: greyColor.withOpacity(.1),
                        leading: controller.imagePath.value == ''
                            ? SvgPicture.asset(imageThumbnail,
                                height: 40, width: 40)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(controller.image)),
                        title: Text(
                            controller.imagePath.value == ''
                                ? ' ${controller.fileTitle.value}'
                                : controller.fileTitle.value,
                            style: black16W600),
                        subtitle: Text("${controller.imageSize.value} KB",
                            style: grey12W500()),
                        trailing: controller.imagePath.value == ''
                            ? SizedBox()
                            : IconButton(
                                onPressed: () {
                                  controller.image = File('');
                                  controller.imagePath('');
                                  controller.fileTitle.value = 'Image';
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  size: 22.18,
                                  color: Colors.black,
                                )),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                      border: true,
                      labelText: "Document Number",
                      hintText: "Enter document number",
                      validator: (vale) {}),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.selectDate(context).then((value) {
                        controller.documentIssueDate.text =
                            '${value!.day}/${value.month}/${value.year}';
                        controller.issueDate = value;
                      });
                    },
                    child: AppTextField(
                      enabled: false,
                      textEditingController: controller.documentIssueDate,
                      validator: (v) {
                        if (v.toString().isEmpty) {
                          return "Please select issue date ";
                        }
                      },
                      hintText: "Issue Date",
                      labelText: "Issue Date",
                      border: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.selectDate(context).then((value) {
                        controller.documentExpiryDate.text =
                            '${value!.day}/${value.month}/${value.year}';
                        controller.expiryDate = value;
                      });
                    },
                    child: AppTextField(
                      enabled: false,
                      textEditingController: controller.documentExpiryDate,
                      validator: (v) {
                        if (v.toString().isEmpty) {
                          return "Please select expiry date";
                        }
                      },
                      hintText: "Expiry Date",
                      labelText: "Expiry Date",
                      border: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                      ()=> CustomDropDown(
                        onSelected: (value){
                          controller.selectedCountry = value;
                        },
                        list: controller.countriesList.value,
                      title: "Country",
                    ),
                  ),
                  const SizedBox(height: 30,),
                  AppCustomButton(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                       showLoadingDialog(context);
                       controller.uploadDocuments();
                      }
                    },
                    buttonText: "Upload",
                  )
                ]))),
      ),
    );
  }
}
