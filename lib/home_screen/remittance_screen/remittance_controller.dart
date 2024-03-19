import 'package:get/get.dart';
import 'package:ramad_pay/model/remittance_list_model.dart';

import '../../model/basic_list_model.dart';
import '../../model/remittance_lookup_values.dart';
import '../../service/remittance_service.dart';

class RemittanceController extends GetxController with StateMixin{
  final RemittanceService _service = RemittanceService();
  RxList<DataModel> beneficiariesList = <DataModel>[].obs;
  List<RemittanceData> remittanceList = <RemittanceData>[];
  RxList<BeneficiaryRefNo> purposeOfPay = <BeneficiaryRefNo>[].obs;
  RxList<BeneficiaryRefNo> sourceOfIncome = <BeneficiaryRefNo>[].obs;
  RxList<BeneficiaryRefNo> incomeSourceType = <BeneficiaryRefNo>[].obs;
  RxList<BeneficiaryRefNo> paymentMethod = <BeneficiaryRefNo>[].obs;
  RxList<BeneficiaryRefNo> beneficiaryRefNos = <BeneficiaryRefNo>[].obs;

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
}