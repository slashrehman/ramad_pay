import 'dart:convert';

import 'package:ramad_pay/utils/print_console.dart';

import '../helpers/api_base_helpers.dart';
import '../utils/end_points.dart';

class HomeService{
  final ApiBaseHelper _service = ApiBaseHelper();
  Future<bool> getCountries() async {
    try {
      final response = await _service.httpRequest(
          endPoint: EndPoints.getCountries,
          requestType: getRequest,
          params: "");
      final parsed = json.decode(response.body);
      // // LoginSuccessModel loginSuccessModel = loginSuccessModelFromJson(parsed);
      // if(loginSuccessModel.status){
      //   _sharedPref.saveString(SharedPref.accessToken, loginSuccessModel.data.accesstoken);
      //   _sharedPref.saveString(SharedPref.refreshToken, loginSuccessModel.data.refreshtoken);
      //   return true;
      // }else{
      //   showSnackBar(loginSuccessModel.message!);
      //   return false;
      // }
      printInConsole(data: parsed);
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<bool> getCountryStates({ required String countryCode}) async{
    try{
    final response = await _service.httpRequest(
        endPoint: EndPoints.getStates, requestType: getRequest, params: '?ccode=$countryCode');
    return true;
    }catch(e){
      return false;
    }
  }


  Future<bool> getOccupation({ required String countryCode}) async{
    try{
      final response = await _service.httpRequest(
          endPoint: EndPoints.getOccupation, requestType: getRequest, params: '');
      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool> getNationalities({ required String countryCode}) async{
    try{
      final response = await _service.httpRequest(
          endPoint: EndPoints.getNationalities, requestType: getRequest, params: '');
      return true;
    }catch(e){
      return false;
    }
  }
}