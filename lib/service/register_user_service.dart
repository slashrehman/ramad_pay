import 'dart:convert';
import 'package:ramad_pay/utils/print_console.dart';

import '../helpers/api_base_helpers.dart';
import '../model/register_mobile_model.dart';
import '../utils/end_points.dart';

class RegisterService{
  final ApiBaseHelper _service = ApiBaseHelper();
  Future<bool> registerPhoneNum({required var requestBody}) async {
    printInConsole(data: requestBody.toString());
      final response = await _service.httpRequest(
          endPoint: EndPoints.registerMobile,
          requestType: postRequest,
          requestBody: requestBody,
          params: "");
      final parsed = json.decode(response.body);
      RegisterMobileModel newsResponse = RegisterMobileModel.fromJson(parsed);
      if(newsResponse.result!.contains('Success')){
        return true;
      }else if(newsResponse.status ==400){
        printInConsole(data: "${parsed['errors']['mobile'][0]}");
        return false;
      }else{
        return false;
      }
  }
  Future<bool> verifyOtp({required var requestBody}) async {

    final response = await _service.httpRequest(
        endPoint: EndPoints.verifyOtp,
        requestType: postRequest,
        requestBody: requestBody,
        params: "");
    final parsed = json.decode(response.body);
    RegisterMobileModel newsResponse = RegisterMobileModel.fromJson(parsed);
    if(newsResponse.result!.contains('Success')){
      return true;
    }else if(newsResponse.status ==400){
      printInConsole(data: "${parsed['error']['mobile'][0]}");
      return false;
    }else{
      return false;
    }
  }

  Future<bool> registerUser({required var requestBody}) async {

    final response = await _service.httpRequest(
        endPoint: EndPoints.signUp,
        requestType: postRequest,
        requestBody: requestBody,
        params: "");
    final parsed = json.decode(response.body);
    RegisterMobileModel newsResponse = RegisterMobileModel.fromJson(parsed);
    if(newsResponse.result!.contains('Success')){
      return true;
    }else if(newsResponse.status ==400){
      printInConsole(data: "${parsed['error']['mobile'][0]}");
      return false;
    }else{
      return false;
    }
  }

}