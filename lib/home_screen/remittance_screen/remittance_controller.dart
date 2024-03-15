import 'package:get/get.dart';

import '../../model/basic_list_model.dart';
import '../../service/remittance_service.dart';

class RemittanceController extends GetxController with StateMixin{
  final RemittanceService _service = RemittanceService();
  RxList<DataModel> beneficiariesList = <DataModel>[].obs;

  @override
  void onInit() {
    _service.getBenKeyValues().then((value) {
      beneficiariesList.value = value.data;
      change(null, status: RxStatus.success());
    });
    super.onInit();
  }
}