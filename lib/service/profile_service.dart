import '../helpers/api_base_helpers.dart';
import '../utils/end_points.dart';

class UserProfileService {
  final ApiBaseHelper _service = ApiBaseHelper();

  Future<bool> getProfile() async{
    try{
      final response = await _service.httpRequest(
          endPoint: EndPoints.getUserProfile, requestType: getRequest, params: '');
      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool> addEditCustomerDetails({required var requestBody}) async{
    try{
      final response = await _service.httpRequest(
          endPoint: EndPoints.addEditCustomer, requestType: postRequest,
          requestBody: requestBody,
          params: '');
      return true;
    }catch(e){
      return false;
    }
  }
}