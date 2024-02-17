import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';
import 'package:ramad_pay/service/documents_services.dart';
import 'package:ramad_pay/service/home_service.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';

import '../../../app_basics/display_text.dart';
import '../../../model/basic_list_model.dart';
import '../../../utils/snack_bar.dart';
import '../../../utils/utils.dart';

class AddDocumentsController extends GetxController with StateMixin{
  final DocumentsService _documentsService = DocumentsService();
  final HomeService _homeService = HomeService();
  TextEditingController documentType = TextEditingController();
  TextEditingController documentNumber = TextEditingController();
  TextEditingController documentIssueDate = TextEditingController();
  TextEditingController documentExpiryDate = TextEditingController();
  DateTime issueDate= DateTime(2022, 06);
  DateTime expiryDate= DateTime(2023, 06);
  RxList<DataModel> documentsTypesList = <DataModel>[].obs;
  RxList<DataModel> countriesList = <DataModel>[].obs;
  DataModel? selectedDocument;
  DataModel? selectedCountry;
  RxString fileTitle = 'Choose File'.obs;

  final profileController = Get.find<ProfileController>();
  @override
  void onInit() {
    _documentsService.getDocumentsTypes().then((value) {
      documentsTypesList.value = value.data;
      change(null, status: RxStatus.success());
    });
    _homeService.getNationalities().then((value) {
      countriesList.value = value.data;
    });
    super.onInit();
  }
    File image = File('');
  RxString imagePath = ''.obs;
  RxString imageSize = ''.obs;
  void pickFileImage(ImageSource imageSource) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: imageSource);
    image = File(pickedFile!.path);
    imagePath.value= pickedFile.path;
    imageSize.value = getImageSize(image);
  }

  DateTime dob = DateTime.now();
  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2030),
    );
   return picked;
  }
  void chooseImageSourceDialog(){
    Get.defaultDialog(
        title: "Choose Image From",
        content: Column(
          children: [
            TextButton(onPressed: (){
              Get.back();

              pickFileImage(ImageSource.camera);
            }, child: Text("Camera")),
            TextButton(onPressed: (){
              Get.back();
              pickFileImage(ImageSource.gallery);
            }, child: Text("Gallery")),
          ],
        )
    );
  }

  void uploadDocuments(){

    Map<String, String> requestBody = {
    "CustId": profileController.refNumber,
    "DocumentType": selectedDocument!.key,
    "DocumentNumber": documentNumber.text,
    "IssueDate": DateFormat('dd/MM/yyyy').format(issueDate),
    "ExpiryDate": DateFormat('dd/MM/yyyy').format(expiryDate),
      //DateFormat('yyyy-MM-ddTHH:mm:ss').format(dob
    "Country": selectedCountry!.key,
    "TrId": "6"
    };
    _documentsService.uploadDocuments(requestBody: requestBody, filePath: image).then((value) {
      if(value){
        Get.back();
        Get.back();
        showSnackBar("Document Upload done!");
        onInit();
        // Get.until((route) => Get.currentRoute == AppRoutes.mainScreen);
      }else{
        Get.back();
        showSnackBar(generalErrorText);
      }
    });
  }
}