import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/display_text.dart';
import 'package:ramad_pay/model/basic_list_model.dart';
import 'package:intl/intl.dart';
import 'package:ramad_pay/utils/print_console.dart';
import 'package:ramad_pay/utils/snack_bar.dart';
import '../../model/user_profile_model.dart';
import '../../service/home_service.dart';
class ProfileController extends GetxController with StateMixin {
  TextEditingController? name;
  TextEditingController? firstName;
  TextEditingController? middleName;
  TextEditingController? lastName;
  TextEditingController? phone;
  TextEditingController? email;
  TextEditingController dobController = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController userState = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController nationality = TextEditingController();

  RxList<DataModel> occupations = <DataModel>[].obs;
  RxList<DataModel> nationalities = <DataModel>[].obs;
  RxList<DataModel> countryListModel = <DataModel>[].obs;
  RxList<DataModel> countryStates = <DataModel>[].obs;
  RxBool isEdit = false.obs;
  String refNumber ='';
   sear(String a){
   // return cities.where((element) => element.value.toLowerCase().contains(a.toLowerCase())).toList();
  }
  final HomeService _homeService = HomeService();

  DateTime dob = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dob,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2030),
    );
    if (picked != null && picked != dob) {
      dob = picked;
      dobController.text = '${dob.day}/${dob.month}/${dob.year}';
    }
  }

@override
  void onInit() {
    _homeService.getCustomer().then((value) async{
      if(value.status){
        await setUserData(userProfileModel: value);
      }else{
        change(null,status: RxStatus.error(generalErrorText));
      }
    });
    super.onInit();
  }
 setUserData({required UserProfileModel userProfileModel}){
  name = TextEditingController(text: userProfileModel.data.cust.firstName + userProfileModel.data.cust.lastName);
  firstName= TextEditingController(text: userProfileModel.data.cust.firstName);
  middleName= TextEditingController(text: userProfileModel.data.cust.middleName);
  lastName= TextEditingController(text: userProfileModel.data.cust.lastName);
  phone = TextEditingController(text: userProfileModel.data.cust.mobile);
  email = TextEditingController(text: userProfileModel.data.cust.email);
   address = TextEditingController(text: userProfileModel.data.cust.address??"");
   dobController = TextEditingController(text: userProfileModel.data.cust.dateOfBirth??'');
   country = TextEditingController(text: userProfileModel.data.cust.country??'');
   city = TextEditingController(text: userProfileModel.data.cust.city??'');
   occupation = TextEditingController(text: userProfileModel.data.cust.occupation??'');
  refNumber = userProfileModel.data.cust.refNo.toString();
  change(null,status: RxStatus.success());
}

  void loadEditProfileData(){
    change(null, status: RxStatus.loading());
    _homeService.getCountries().then((value) {
      countryListModel.value = value.data;
    });
    _homeService.getCountryStates(countryCode: "CA").then((value) {
      countryStates.value = value.data;
    });
    _homeService.getOccupation().then((value) {
      occupations.value = value.data;
    });
    _homeService.getNationalities().then((value) {
      nationalities.value = value.data;
    });
    change(null, status: RxStatus.success());
  }

  void fetchStates(String countryCode){
    _homeService.getCountryStates(countryCode: countryCode).then((value) {
      countryStates.value = value.data;
    });
  }

  void saveUserData(){
    var param = {
      "RefNo":refNumber,
      "FirstName": firstName!.text,
      "MiddleName": middleName!.text,
      "LastName": lastName!.text,
      "address": address.text,
      "Address_2": '',
      "DateOfBirth": DateFormat('yyyy-MM-ddTHH:mm:ss').format(dob),
      "Email": email!.text,
      "Mobile": phone!.text,
      "City": city.text,
      "PostalCode": "54321",
      "Country": country.text,
      "State": userState.text,
      "Nationality":nationality.text,
      "Occupation":occupation.text,
      "PlaceOfBirth": nationality.text,
    };

    printInConsole(data: "$param");
    _homeService.saveUserDetails(param).then((value) {
      if(value){
        Get.back();
        Get.back();
        showSnackBar("Profile Update!");
        onInit();
        // Get.until((route) => Get.currentRoute == AppRoutes.mainScreen);
      }else{
        Get.back();
        showSnackBar(generalErrorText);
      }
    });
  }
}
