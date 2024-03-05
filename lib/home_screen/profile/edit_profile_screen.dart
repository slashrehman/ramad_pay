import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/home_screen/profile/profile_controller.dart';
import 'package:ramad_pay/utils/text_styles.dart';
import '../../app_basics/colors.dart';
import '../../app_basics/formValidator.dart';
import '../../app_basics/images.dart';
import '../../app_basics/text_field.dart';
import '../../utils/loading_dialog.dart';
import '../../widgets/type_ahead_widget.dart';

class EditProfileScreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final profileController = Get.find<ProfileController>();
   EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
      title:  Text("Edit Profile", style: headingTextStyle),
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
      body: profileController.obx(
        (state)=> SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    textEditingController:profileController.firstName,
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
                    textEditingController:profileController.middleName,
                    validator: (v){},
                    hintText: "Middle Name",
                    labelText: "Middle Name",
                    border: true,
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    textEditingController:profileController.lastName,
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
                    textEditingController:profileController.email,
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
                  SizedBox(height: 16),
                  AppTextField(
                    textEditingController:profileController.phone,
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
                  AppTextField(
                    textEditingController:profileController.address,
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
                  GestureDetector(
                    onTap: (){
                      profileController.selectDate(context);
                    },
                    child: AppTextField(
                      enabled: false,
                      textEditingController:profileController.dobController,
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
                        list: profileController.occupations.value,
                        textEditingController: profileController.occupation,
                        onSelected: (occupation){
                          profileController.occupation.text= occupation.value;
                        },
                        label: "Occupation"
                    ),
                  ),
                  const SizedBox(height: 16),
                Obx(
                  ()=> buildTypeAheadField(
                         list: profileController.countryListModel.value,
                          textEditingController: profileController.country,
                        onSelected: (country){
                           profileController.country.text= country.value;
                           profileController.fetchStates(country.key);
                        },
                        label: "Country"
                      ),
                ),
                  const SizedBox(height: 16),
                  Obx(
                    ()=> buildTypeAheadField(
                        list: profileController.countryStates.value,
                        textEditingController: profileController.userState,
                        onSelected: (state){
                          profileController.userState.text= state.value;
                        },
                        label: "States"
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    textEditingController: profileController.city,
                     validator: (value){
                       if(value.toString().isEmpty){
                         return "Please enter city";
                       }
                     },
                    border: true,
                    labelText: "Ciy",
                    hintText: "Enter City Name",
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    ()=> buildTypeAheadField(
                        list: profileController.nationalities.value,
                        textEditingController: profileController.nationality,
                        onSelected: (nationality){
                          profileController.nationality.text= nationality.value;
                        },
                        label: "Nationality"
                    ),
                  ),
                  const SizedBox(height: 180,),
                ],
              )
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: primaryColor,
        child: InkWell(
          onTap: () {
            if(_formKey.currentState!.validate()){
              showLoadingDialog(context);
              profileController.saveUserData();
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
