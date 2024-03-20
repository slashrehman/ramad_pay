import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ramad_pay/model/remittance_list_model.dart';
import 'package:ramad_pay/utils/snack_bar.dart';
import '../../app_basics/app_routes.dart';
import '../../model/basic_list_model.dart';
import '../../service/remittance_service.dart';

class RemittanceController extends GetxController with StateMixin{
  final RemittanceService _service = RemittanceService();
  RxList<DataModel> beneficiariesList = <DataModel>[].obs;
  List<RemittanceData> remittanceList = <RemittanceData>[];
  RxList<DataModel> purposeOfPay = <DataModel>[].obs;
  RxList<DataModel> sourceOfIncome = <DataModel>[].obs;
  RxList<DataModel> incomeSourceType = <DataModel>[].obs;
  RxList<DataModel> paymentMethod = <DataModel>[].obs;
  RxList<DataModel> beneficiaryRefNos = <DataModel>[].obs;
  RxList<DataModel> beneficiarySendingCity = <DataModel>[].obs;
  RxList<DataModel> sendingCity = <DataModel>[].obs;
  RxList<DataModel> corrAgencyCode = <DataModel>[].obs;
  RxList<DataModel> payOutCurrency = <DataModel>[].obs;
  RxList<DataModel> payMode = <DataModel>[].obs;
  RxBool isBank = false.obs;
  @override
  void onInit() {
    getRemittanceList().then((value) {
      Future.wait([getBenKeyValues(), getLooUpValues()])
          .then((value) {
        change(null, status: RxStatus.success());
      });
    });
    super.onInit();
  }

  Future getLooUpValues() async {
    _service.getLookUpValues().then((value) {
      purposeOfPay.value = value.data!.purposesOfPay!;
      sourceOfIncome.value = value.data!.sourceOfIncome!;
      incomeSourceType.value = value.data!.incomeSourceType!;
      beneficiaryRefNos.value = value.data!.beneficiaryRefNos!;
    });
  }
  Future getRemittanceList() async {
    _service.getRemittanceList().then((value) {
      remittanceList = value.data!;
    });
  }
  Future getBenKeyValues() async {
    _service.getBenKeyValues().then((value) {
      beneficiariesList.value = value.data;
    });
  }
  Future getBenSendingCity(String benId) async {
    _service.getBenSendingCity(benId).then((value) {
      sendingCity.value = value;
    });
  }
  Future getCorrAgencyCode(String city) async {
    _service.getAgencyCode(city).then((value) {
      corrAgencyCode.value = value.data;
    });
  }
  Future getPayModeCurrency(String agent) async {
    _service.getPayModeCurrency(agent).then((value) {
      payOutCurrency.value = value.data!.curr!;
      payMode.value = value.data!.payMode!;
    });
  }

  DataModel beneficiary = DataModel(key: '', value: '');
  DataModel sendingCitySelected = DataModel(key: '', value: '');
  DataModel selectedAgency = DataModel(key: '', value: '');
  DataModel payOutCurrencySelected = DataModel(key: '', value: '');
  TextEditingController exchangeRate = TextEditingController();
  DataModel receiverModeOfPayment = DataModel(key: '', value: '');
  DataModel purpose = DataModel(key: '', value: '');
  DataModel sourceOfIncomeSelected = DataModel(key: '', value: '');
  TextEditingController payOutAmount = TextEditingController();
  TextEditingController ramadCommission = TextEditingController();
  TextEditingController totalAmount = TextEditingController();
  TextEditingController benAccountNum = TextEditingController();
  TextEditingController benAccountTitle = TextEditingController();
  TextEditingController benBankName = TextEditingController();
  TextEditingController benBankAddress = TextEditingController();
  TextEditingController benSwiftCode = TextEditingController();

  void addRemittance()async{
    //{
    //     "TransId": 0, //not required autp
    //     "TrDate": null,//not required
    //     "CorrId": 0,//not required
    //     "CorrAgencyCode": "GCC064",
    //     "SenderId": 0,// not required will take from login
    //     "BeneficiaryId": "1002", //lookup beneficiaries
    //     "SendingCity": "DXB", //benCities
    //     "Purpose": "2", //from lookupvalues purposes
    //     "PurposeDescription": "", //if 'Purpose').value === '7'
    //     "SourceOfIncome": "2",//from lookupvalues IncSource
    //     "PayoutCurrency": "AED", //from agemt currency
    //     "PayoutAmount": "1000",
    //     "ExchRate": 3.6687, //from agent currency
    //     "TotalAmount": "286.21",
    //     "RamadCommision": "13.63", //5% of total temporary
    //     "ReceiverModeOfPayment": "1", //from agen paymode
    //     "SenderModeOfPayment": 0,// not required
    //     "Remarks": "", // default not required
    //     "SenderAccountNo": null, //required only ReceiverModeOfPayment ==2
    //     "SenderAccountTitle": null,//required only ReceiverModeOfPayment=2
    //     "SenderAccountCurrency": null,//required only ReceiverModeOfPayment=2
    //     "BeneficiaryAccountNo": null,//required only ReceiverModeOfPayment=2 or 3
    //     "BeneficiaryAccountTitle": null,//required only ReceiverModeOfPayment=2 or 3
    //     "BeneficiaryAccountCurrency": null,//required only ReceiverModeOfPayment=2
    //     "BeneficiaryBankName": null,//required only ReceiverModeOfPayment=3
    //     "BeneficiaryBankAddress": null,//required only ReceiverModeOfPayment= 3
    //     "BeneficiarySwiftCode": "",//required only ReceiverModeOfPayment=2 or 3
    //     "BeneficiaryBranchName": "",//required only ReceiverModeOfPayment= 4
    //     "BeneficaryBankCountry": "",//required only ReceiverModeOfPayment=4
    //     "BeneficiaryIFSC": null,
    //     "CorrTrRefrenace": "",
    //     "CorrTrStatus": ""
    // }
    var data = {

          "TransId": 0, //not required autp
          "TrDate": null,//not required
          "CorrId": 0,//not required
          "CorrAgencyCode": selectedAgency.key,
          "SenderId": 0,// not required will take from login
          "BeneficiaryId": beneficiary.key, //lookup beneficiaries
          "SendingCity": sendingCitySelected.key, //benCities
          "Purpose": purpose.key, //from lookupvalues purposes
          "PurposeDescription": "", //if 'Purpose').value === '7'
          "SourceOfIncome": sourceOfIncomeSelected.key,//from lookupvalues IncSource
          "PayoutCurrency": payOutCurrencySelected.key, //from agemt currency
          "PayoutAmount": payOutAmount.text,
          "ExchRate": exchangeRate.text, //from agent currency
          "TotalAmount": totalAmount.text,
          "RamadCommision": ramadCommission.text, //5% of total temporary
          "ReceiverModeOfPayment": receiverModeOfPayment.key, //from agen paymode
          "SenderModeOfPayment": 0,// not required
          "Remarks": "", // default not required
          "SenderAccountNo": null, //required only ReceiverModeOfPayment ==2
          "SenderAccountTitle": null,//required only ReceiverModeOfPayment=2
          "SenderAccountCurrency": null,//required only ReceiverModeOfPayment=2
          "BeneficiaryAccountNo": benAccountNum.text,//required only ReceiverModeOfPayment=2 or 3
          "BeneficiaryAccountTitle": benAccountTitle.text,//required only ReceiverModeOfPayment=2 or 3
          "BeneficiaryAccountCurrency": null,//required only ReceiverModeOfPayment=2
          "BeneficiaryBankName": benBankName.text,//required only ReceiverModeOfPayment=3
          "BeneficiaryBankAddress": benBankAddress.text,//required only ReceiverModeOfPayment= 3
          "BeneficiarySwiftCode": benSwiftCode.text,//required only ReceiverModeOfPayment=2 or 3
          "BeneficiaryBranchName": "",//required only ReceiverModeOfPayment= 4
          "BeneficaryBankCountry": "",//required only ReceiverModeOfPayment=4
          "BeneficiaryIFSC": null,
          "CorrTrRefrenace": "",
          "CorrTrStatus": ""

    };
    print("${data}");
    _service.postRemittance(data).then((value) {
      if(value.status){
        //close dialog
        Get.back();
        showSnackBar("${value.message}");
        getRemittanceList().then((value) {
          Get.back();
        });

      }else{
        Get.back();
        showSnackBar("${value.message}");
      }
    });
  }

  void calculateCommission(int value){
    dynamic commission= value * .05;
    dynamic totalNetAmount = value+ commission;
    ramadCommission.text = commission.toString();
    totalAmount.text = totalNetAmount.toString();
    print("sss");
  }
}