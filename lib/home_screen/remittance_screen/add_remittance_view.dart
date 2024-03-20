import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/app_basics/text_field.dart';
import 'package:ramad_pay/home_screen/remittance_screen/remittance_controller.dart';
import 'package:ramad_pay/utils/loading_dialog.dart';
import 'package:ramad_pay/utils/snack_bar.dart';
import 'package:ramad_pay/utils/utils.dart';
import '../../app_basics/app_button.dart';
import '../../app_basics/colors.dart';
import '../../utils/text_styles.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/custom_drop_down.dart';

class AddRemittanceView extends StatelessWidget {
  AddRemittanceView({super.key});

  GlobalKey<FormState> _key = GlobalKey();
  final controller = Get.put(RemittanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        (child) => SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _key,
            child: Column(
              children: [
                CustomDropDown(
                  onSelected: (value) {
                    controller.beneficiary = value;
                    controller.getBenSendingCity(value.key);
                  },
                  list: controller.beneficiariesList.value,
                  title: "Beneficiary",
                ),
                widgetVerticalPadding,
                Obx(
                  () => CustomDropDown(
                    onSelected: (value) {
                      controller.sendingCitySelected = value;
                      controller.getCorrAgencyCode(value.key);
                    },
                    list: controller.sendingCity.value,
                    title: "Sending City",
                  ),
                ),
                widgetVerticalPadding,
                Obx(
                  () => CustomDropDown(
                    onSelected: (value) {
                      controller.selectedAgency = value;
                      controller.getPayModeCurrency(value.key);
                    },
                    list: controller.corrAgencyCode.value,
                    title: "Corr agency Code",
                  ),
                ),
                widgetVerticalPadding,
                Obx(
                  () => CustomDropDown(
                    onSelected: (value) {
                      controller.payOutCurrencySelected = value;
                      controller.exchangeRate.text = value.value;
                    },
                    list: controller.payOutCurrency.value,
                    title: "Payout Currency",
                  ),
                ),
                widgetVerticalPadding,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AppTextField(
                      readOnly: true,
                      textEditingController: controller.exchangeRate,
                      border: true,
                      labelText: "Exchange Rate",
                      validator: (validator) {}),
                ),
                widgetVerticalPadding,
                Obx(
                  () => CustomDropDown(
                    onSelected: (value) {
                      print("${value.key} ${value.value}");
                      if (value.key == "1") {
                        controller.isBank(false);
                      } else {
                        controller.isBank(true);
                      }
                      controller.receiverModeOfPayment = value;
                    },
                    list: controller.payMode.value,
                    title: "Receiver Mode of Payment",
                  ),
                ),
                widgetVerticalPadding,
                CustomDropDown(
                  onSelected: (value) {
                    controller.purpose = value;
                  },
                  list: controller.purposeOfPay.value,
                  title: "Purpose",
                ),
                widgetVerticalPadding,
                CustomDropDown(
                  onSelected: (value) {
                    controller.sourceOfIncomeSelected = value;
                  },
                  list: controller.sourceOfIncome.value,
                  title: "Source of Income",
                ),
                widgetVerticalPadding,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      AppTextField(
                          isOnChanged: true,
                          keyboardType: TextInputType.number,
                          textEditingController: controller.payOutAmount,
                          onChanged: (value) {
                            controller.calculateCommission(int.parse(value));
                          },
                          border: true,
                          labelText: "Payout Amount",
                          validator: (validator) {
                            if(validator.toString().isEmpty){
                              return "Please enter Payout amount";
                            }
                          }),
                      widgetVerticalPadding,
                      AppTextField(
                          readOnly: true,
                          textEditingController: controller.ramadCommission,
                          border: true,
                          labelText: "Ramad Commission",
                          validator: (validator) {}),
                      widgetVerticalPadding,
                      AppTextField(
                          readOnly: true,
                          textEditingController: controller.totalAmount,
                          border: true,
                          labelText: "Total Amount",
                          validator: (value) {}),
                      widgetVerticalPadding,
                      Obx(
                        () => Visibility(
                            visible: controller.isBank.value,
                            child: Column(
                              children: [
                                AppTextField(
                                    textEditingController:
                                        controller.benAccountNum,
                                    border: true,
                                    labelText: "Beneficiary account No.",
                                    validator: (validator) {
                                      if(validator.toString().isEmpty){
                                        return "Please enter account number";
                                      }
                                    }),
                                widgetVerticalPadding,
                                AppTextField(
                                    textEditingController:
                                        controller.benAccountTitle,
                                    border: true,
                                    labelText: "Beneficiary account Title",
                                    validator: (validator) {
                                      if(validator.toString().isEmpty){
                                        return "Please enter account title";
                                      }
                                    }),
                                widgetVerticalPadding,
                                AppTextField(
                                    textEditingController:
                                        controller.benBankName,
                                    border: true,
                                    labelText: "Beneficiary Bank Name",
                                    validator: (validator) {
                                      if(validator.toString().isEmpty){
                                        return "Please enter Bank Name";
                                      }
                                    }),
                                widgetVerticalPadding,
                                AppTextField(
                                    textEditingController:
                                        controller.benBankAddress,
                                    border: true,
                                    labelText: "Beneficiary Bank address",
                                    validator: (validator) {
                                      if(validator.toString().isEmpty){
                                        return "Please enter Bank address";
                                      }
                                    }),
                                widgetVerticalPadding,
                                AppTextField(
                                    textEditingController:
                                        controller.benSwiftCode,
                                    border: true,
                                    labelText: "Beneficiary Swift code",
                                    validator: (validator) {
                                      if(validator.toString().isEmpty){
                                        return "Please enter Swift code";
                                      }
                                    }),
                                widgetVerticalPadding,
                              ],
                            )),
                      ),
                      AppCustomButton(
                        buttonText: "SAVE",
                        onTap: () {
                          if (controller.receiverModeOfPayment.value == '') {
                            showSnackBar("Please select required fields");
                          } else if (_key.currentState!.validate()) {
                            showLoadingDialog(context);
                            controller.addRemittance();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
