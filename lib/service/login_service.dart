import 'dart:convert';
import 'package:ramad_pay/model/login_success_model.dart';
import 'package:ramad_pay/utils/snack_bar.dart';

import '../helpers/api_base_helpers.dart';
import '../model/register_mobile_model.dart';
import '../utils/end_points.dart';

class LoginService{
  final ApiBaseHelper _service = ApiBaseHelper();
  Future<bool> loginUser({required var requestBody}) async {
    try {
      final response = await _service.httpRequest(
          endPoint: EndPoints.login,
          requestType: postRequest,
          requestBody: requestBody,
          params: "");
      final parsed = json.decode(response.body);
      LoginSuccessModel loginSuccessModel = LoginSuccessModel.fromJson(parsed);
      if(loginSuccessModel.accessToken !=''){
        return true;
      }else{
        showSnackBar('${parsed['error']}');
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendRestPasswordOTPEmail({required var email}) async {
    try {
      final response = await _service.httpRequest(
          endPoint: EndPoints.sendResetPasswordOTP,
          requestType: getRequest,
          params: "?email=$email");
      final parsed = json.decode(response.body);
      print("$parsed 89898 \n ${parsed['result']}");
      // LoginSuccessModel loginSuccessModel = LoginSuccessModel.fromJson(parsed);
      if(parsed['result'].toString().toUpperCase() == 'OK'){
        return true;
      }else{
        showSnackBar('Error');
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  Future<bool> resetPassword({required var requestBody}) async {
    try {
      final response = await _service.httpRequest(
          endPoint: EndPoints.resetPassword,
          requestType: postRequest,
          requestBody: requestBody,
          params: "");
      final parsed = json.decode(response.body);
      LoginSuccessModel loginSuccessModel = LoginSuccessModel.fromJson(parsed);
      if(loginSuccessModel.accessToken !=''){
        return true;
      }else{
        showSnackBar('${parsed['error']}');
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}