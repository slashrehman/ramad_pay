import 'dart:convert';
import 'package:ramad_pay/app_basics/display_text.dart';
import 'package:ramad_pay/model/base_response_model.dart';
import 'package:ramad_pay/utils/print_console.dart';
import 'package:ramad_pay/utils/snack_bar.dart';

import '../helpers/api_base_helpers.dart';
import '../model/register_mobile_model.dart';
import '../utils/end_points.dart';

class RegisterService {
  final ApiBaseHelper _service = ApiBaseHelper();

  Future<bool> registerPhoneNum({required var requestBody}) async {
    printInConsole(data: requestBody.toString());
    final response = await _service.httpRequest(
        endPoint: EndPoints.registerMobile,
        requestType: postRequest,
        requestBody: requestBody,
        params: "");
    final parsed = json.decode(response.body);
    BaseResponseModel registerPhone = baseResponseModel(response.body);
    if (registerPhone.status!) {
      return true;
    } else if (registerPhone.status == 400) {
      printInConsole(data: "${parsed['errors']['mobile'][0]}");
      showSnackBar("${parsed['errors']['mobile'][0]}");
      return false;
    } else {
      showSnackBar(generalErrorText);
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
    BaseResponseModel verifyOTPResponse = BaseResponseModel.fromJson(parsed);
    if (verifyOTPResponse.status!) {
      return true;
    } else {
      printInConsole(data: verifyOTPResponse.message!);
      showSnackBar(verifyOTPResponse.message!);
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
    BaseResponseModel registerUserData = BaseResponseModel.fromJson(parsed);
    if (registerUserData.status!) {
      return true;
    } else if (!registerUserData.status!) {
      printInConsole(data: registerUserData.message!);
      showSnackBar(registerUserData.message!);
      return false;
    } else {
      showSnackBar(generalErrorText);
      return false;
    }
  }
}
