import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/widgets/type_ahead_widget.dart';
import '../../app_basics/colors.dart';
import '../../app_basics/formValidator.dart';
import '../../app_basics/text_field.dart';
import '../../utils/loading_dialog.dart';
import '../profile/documents_screen/add_documents_screen.dart';
import 'beneficiaries_controller.dart';
class AddBeneficiariesScreen extends StatelessWidget {

  final controller = Get.find<BeneficiariesController>();

  AddBeneficiariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(.5),
        title: const  Text("Add Beneficiary"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                label: "State", textEditingController: controller.stateUser,
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
                validator: (val){}, labelText: "Postal Code", border: true),
            const SizedBox(height: 16,),
            Obx(
                  ()=> buildTypeAheadField(
                  list: controller.occupations.value,
                  textEditingController: controller.occupation,
                  onSelected: (occupation){
                    controller.occupation.text= occupation.value;
                  },
                  label: "Occupation"
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: primaryColor,
        child: InkWell(
          onTap: () {
            showLoadingDialog(context);
            controller.addBeneficiaries();
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
