import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/images.dart';
import 'package:ramad_pay/widgets/type_ahead_widget.dart';
import '../../app_basics/colors.dart';
import '../../app_basics/formValidator.dart';
import '../../app_basics/text_field.dart';
import '../../utils/loading_dialog.dart';
import '../../widgets/clickable_svg.dart';
import '../profile/documents_screen/add_documents_screen.dart';
import 'beneficiaries_controller.dart';
class AddBeneficiariesScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final controller = Get.find<BeneficiariesController>();

  AddBeneficiariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor.withOpacity(.9),
        title: const  Text("Add Beneficiary", style: TextStyle(color: Colors.white),),
        // leading: buildAppBarButton(context, Icons.arrow_back),
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: SvgPicture.asset(backButton),
          ),

        ),
        leadingWidth: 35,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: [
              AppTextField(
                textEditingController:  controller.firstName,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter first name";
                  }
                },
                hintText: "First Name",
                labelText: "First Name",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.middleName,
                validator: (v){},
                hintText: "Middle Name",
                labelText: "Middle Name",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.lastName,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter email Last";
                  }
                },
                hintText: "Last Name",
                labelText: "Last Name",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.address,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter address";
                  }
                },
                hintText: "Address",
                labelText: "Address",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.email,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter email address";
                  }else if(!FormValidator.validateEmail(v)){
                    return "Please enter valid email";
                  }
                },
                hintText: "Email",
                labelText: "Email",
                border: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                textEditingController: controller.phone,
                validator: (v){
                  if(v.toString().isEmpty){
                    return "Please enter phone you valid phone number";
                  }else if(v.toString().length != 10 ){
                    return "Please enter phone you valid phone number";
                  }
                },
                hintText: "Phone",
                labelText: "Phone",
                border: true,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: (){
                   controller.selectDate(context);
                },
                child: AppTextField(
                  enabled: false,
                  textEditingController: controller.dobController,
                  validator: (v){
                    if(v.toString().isEmpty){
                      return "Please select date of birth";
                    }
                  },
                  hintText: "Date of Birth",
                  labelText: "Date of Birth",
                  border: true,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                  ()=> buildTypeAheadField(
                  onSelected: (value) {
                    controller.countryUser.text = value.value;
                    controller.getCountryStates(value.key);
                    controller.getCountryCities(value.key);
                    // controller.imagePath('');
                    // controller.fileTitle.value = '${value.value} Image';
                  },
                  list: controller.countryListModel.value,
                  label: "Select Beneficiary Country", textEditingController: controller.countryUser,
                ),
              ),
              const SizedBox(height: 16),
              Obx(()=> buildTypeAheadField(
                  onSelected: (value) {
                   controller.stateUser.text = value.value;
                  },
                  list: controller.countryStates.value,
                  label: "State Name", textEditingController: controller.stateUser,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                ()=> buildTypeAheadField(
                  onSelected: (value) {
                    controller.cityUser.text= value.value;
                  },
                  list: controller.cityList.value,
                  label: "City", textEditingController: controller.cityUser,
                ),
              ),
              const SizedBox(height: 16,),
              AppTextField(
                textEditingController: controller.placeOfBirth,
                validator: (val){}, labelText: "Place of birth", border: true),
              const SizedBox(height: 16,),
              Obx(
                    ()=> buildTypeAheadField(
                  onSelected: (value) {
                    controller.nationality.text = value.value;
                  },
                  list: controller.countryListModel.value,
                  label: "Nationality", textEditingController: controller.nationality,
                ),

              ),
              const SizedBox(height: 16,),
              AppTextField(
                  textEditingController: controller.postalCode,
                  validator: (val){
                    if(val.toString().length>5){
                      return "Please enter valid Zip Code";
                    }else if(val.toString().length<5){
                      return "Please enter valid Zip Code";
                    }
                  }, labelText: "Postal Code", border: true),
              const SizedBox(height: 16,),
              Obx(
                    ()=>  CustomDropDown(
                      onSelected: (value) {
                        // controller.selectedDocument = value;
                        // controller.image = File('');
                        // controller.imagePath('');
                        // controller.fileTitle.value = '${value.value} Image';
                      },
                      list: controller.occupations.value,
                      title: "Occupation",
                    ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: primaryColor,
        child: InkWell(
          onTap: () {
            if(_key.currentState!.validate()){
              showLoadingDialog(context);
              controller.addBeneficiaries();
            }
          },
          child: const SizedBox(
            height: 50.0,
            width: double.infinity,
            child: Center(
              child: Text(
                "SAVE",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
