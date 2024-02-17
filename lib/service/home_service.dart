import 'package:ramad_pay/model/base_response_model.dart';
import 'package:ramad_pay/model/country_list_model.dart';
import 'package:ramad_pay/model/states_model.dart';
import '../helpers/api_base_helpers.dart';
import '../model/user_profile_model.dart';
import '../utils/end_points.dart';

class HomeService {
  final ApiBaseHelper _service = ApiBaseHelper();

  Future<CountryListModel> getCountries() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getCountries, requestType: getRequest, params: "");
    CountryListModel countryListModel = countryListModelFromJson(response.body);
    return countryListModel;
  }

  Future<BasicListModel> getCountryStates({required String countryCode}) async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getStates,
        requestType: getRequest,
        params: '?ccode=$countryCode');
    BasicListModel countryStates = basicListModelFromJson(response.body);
    return countryStates;
  }

  Future<UserProfileModel> getCustomer() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getUserProfile,
        requestType: getRequest,
        params: '');
    UserProfileModel userProfileModel = userProfileModelFromJson(response.body);
    return userProfileModel;
  }

  Future<BasicListModel> getOccupation() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getOccupation, requestType: getRequest, params: '');
    BasicListModel occupations = basicListModelFromJson(response.body);
    return occupations;
  }

  Future<BasicListModel> getNationalities() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getNationalities,
        requestType: getRequest,
        params: '');
    BasicListModel nationalities = basicListModelFromJson(response.body);
    return nationalities;
  }

  Future<bool> saveUserDetails(var requestBody) async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.addEditCustomer,
        requestType: postRequest,
        requestBody: requestBody,
        params: '');

    BaseResponseModel responseModel = baseResponseModel(response.body);
    if(responseModel.status == 400){
      return false;
    }else{
      return true;
    }
  }
}
