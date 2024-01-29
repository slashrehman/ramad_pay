import 'dart:convert';
import 'package:ramad_pay/utils/print_console.dart';
import 'package:ramad_pay/utils/snack_bar.dart';

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
        showSnackBar("${parsed['errors']['mobile'][0]}");
        return false;
      }else{
        showSnackBar("Unexpected Error");
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
    }else{
      printInConsole(data: "${parsed['error']}");
      showSnackBar("${parsed['error']}");
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
    if(newsResponse.result!.contains('created')){
      return true;
    }else if(parsed['status'] == 400){
      printInConsole(data: "${parsed['title']}");
      showSnackBar("${parsed['title']}");
      return false;
    }else{
      showSnackBar("Unexpected Error");
      return false;
    }
  }

}