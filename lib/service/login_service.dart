import 'dart:convert';
import '../helpers/api_base_helpers.dart';
import '../model/register_mobile_model.dart';
import '../utils/end_points.dart';

class LoginService{
  final ApiBaseHelper _service = ApiBaseHelper();
  Future<RegisterMobileModel> loginUser({required var requestBody}) async {
    try {
      final response = await _service.httpRequest(
          endPoint: EndPoints.login,
          requestType: postRequest,
          requestBody: requestBody,
          params: "");
      final parsed = json.decode(response.body);
      RegisterMobileModel newsResponse = RegisterMobileModel.fromJson(parsed);
      return newsResponse;
    } catch (e) {
      RegisterMobileModel newsResponse = RegisterMobileModel();
      return newsResponse;
    }
  }
}