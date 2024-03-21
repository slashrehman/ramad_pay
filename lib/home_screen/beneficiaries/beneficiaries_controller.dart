import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramad_pay/model/beneficiaries_model.dart';
import 'package:ramad_pay/service/beneficiaries_service.dart';
import 'package:ramad_pay/utils/print_console.dart';
import 'package:ramad_pay/utils/snack_bar.dart';

import '../../model/basic_list_model.dart';
class BeneficiariesController extends GetxController with StateMixin{

  late BeneficiariesModel beneficiaries;
  final BeneficiariesService _service = BeneficiariesService();
  TextEditingController name = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryUser = TextEditingController();
  TextEditingController cityUser = TextEditingController();
  TextEditingController stateUser = TextEditingController();
  TextEditingController placeOfBirth = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController occupation = TextEditingController();
  RxList<DataModel> countryListModel = <DataModel>[].obs;
  RxList<DataModel> cityList = <DataModel>[].obs;
  RxList<DataModel> countryStates = <DataModel>[].obs;
  RxList<DataModel> occupations = <DataModel>[].obs;

  Future loadInitialData() async {
    change(null, status: RxStatus.loading());
    _service.getBeneficiariesList().then((beneficiariesData) {
      if(beneficiariesData.status!){
        beneficiaries = beneficiariesData;
        change(null, status: RxStatus.success());
      }else{
        beneficiaries = BeneficiariesModel();
      }
    });
    _service.getBenCountries().then((value) {
      countryListModel.value = value.data;
    });
    // _service.getCountryStates(countryCode: "CA").then((value) {
    //   countryStates.value = value.data;
    // });
    _service.getOccupation().then((value) {
      occupations.value = value.data;
    });
  }

  getCountryStates(var countryCode){
    _service.getCountryStates(countryCode: countryCode).then((value) {
      cityList.value = value.data;
    });
  }
  getCountryCities(var countryCode){
    _service.getCities(countryCode: countryCode).then((value) {
      countryStates.value = value.data;
    });
  }
  DateTime dob = DateTime(2023);
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      // initialDate: dob,
      firstDate: DateTime(1940, 1),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != dob) {
      dob = picked;
      dobController.text = '${dob.day}/${dob.month}/${dob.year}';
    }
  }

  void addBeneficiaries(){
    var data = {
      "RefNo": 10,
      "FirstName": firstName.text,
      "MiddleName": middleName.text,
      "LastName": lastName.text,
      "Address": address.text,
      "DateOfBirth": DateFormat('yyyy-MM-ddTHH:mm:ss').format(dob),
      "Email":  email.text,
      "Telephone":"",
      "Mobile": phone.text,
      "City":  cityUser.text,
      "State": stateUser.text,
      "PlaceOfBirth": placeOfBirth.text,
      "Nationality": nationality.text,
      "PostalCode":  postalCode.text,
      "Occupation": occupation.text,
      "Remarks": '',
      "CustReferenceNo":'',
      "IsBeneficiary": true,
      "Country":  countryUser.text,
      "ParentCustId":null
    };
    printInConsole(data: "______________________--\n\n $data ______________________\n \n");
    printInConsole(data: "\n \n \n _________________________________________________________\n \n ");
    _service.addBeneficiaries(data).then((value) {
      if(value){
        Get.back();
        showSnackBar("Beneficiary Added!");
        loadInitialData().then((value) {
          Get.back();
        });
      }else{
        Get.back();
        printInConsole(data: "Error in add beneficiaries");
      }
    });
  }
  
  @override
  void onInit() {
    loadInitialData();
    super.onInit();
  }
}