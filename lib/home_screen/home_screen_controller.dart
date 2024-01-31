import 'package:get/get.dart';
import 'package:ramad_pay/service/home_service.dart';

class HomeScreenController extends GetxController{
  @override
  void onInit() {
        super.onInit();
        getCountries();
  }
 final HomeService _homeService = HomeService();
  void getCountries(){
    _homeService.getCountries();
  }
}