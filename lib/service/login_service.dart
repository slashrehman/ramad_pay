import 'dart:convert';
import 'package:ramad_pay/app_basics/display_text.dart';
import 'package:ramad_pay/helpers/shared_pref_helper.dart';
import 'package:ramad_pay/model/base_response_model.dart';
import 'package:ramad_pay/model/login_success_model.dart';
import 'package:ramad_pay/utils/snack_bar.dart';
import '../helpers/api_base_helpers.dart';
import '../utils/end_points.dart';

class LoginService{
  final ApiBaseHelper _service = ApiBaseHelper();
  Future<bool> loginUser({required var requestBody}) async {
    LoginSuccessModel? loginSuccessModel;
    try {
      final response = await _service.httpRequest(
          endPoint: EndPoints.login,
          requestType: postRequest,
          requestBody: requestBody,
          params: "");
      final parsed = json.decode(response.body);
       loginSuccessModel = loginSuccessModelFromJson(response.body);
      if(loginSuccessModel.status){
        SharedPref.instance.saveString(SharedPref.accessToken, loginSuccessModel.data.accesstoken);
        SharedPref.instance.saveString(SharedPref.refreshToken, loginSuccessModel.data.refreshtoken);
        return true;
      }else{
        showSnackBar(loginSuccessModel.message!);
        return false;
      }
    } catch (e) {
      showSnackBar("Invalid email/Password");
      print("Exception");
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
      BaseResponseModel loginSuccessModel = baseResponseModel(response.body);
      if(loginSuccessModel.status){
        return true;
      }else{
        showSnackBar(generalErrorText);
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
      BaseResponseModel resetData = baseResponseModel(parsed);
      if(resetData.status){
        return true;
      }else{
        showSnackBar('${resetData.message}');
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}