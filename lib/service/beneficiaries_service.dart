import 'dart:convert';

import '../helpers/api_base_helpers.dart';
import '../model/beneficiaries_model.dart';
import '../model/country_list_model.dart';
import '../model/states_model.dart';
import '../utils/end_points.dart';
import '../utils/snack_bar.dart';

class BeneficiariesService{

  final ApiBaseHelper _service = ApiBaseHelper();

  Future<CountryListModel> getBenCountries() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getBenCountries, requestType: getRequest, params: "");
    CountryListModel countryListModel = countryListModelFromJson(response.body);
    return countryListModel;
  }

  Future<BeneficiariesModel> getBeneficiariesList() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getBeneficiariesList, requestType: getRequest, params: "");
    BeneficiariesModel countryListModel = beneficiariesModelFromJson(response.body);
    return countryListModel;
  }
  Future<BasicListModel> getOccupation() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getOccupation, requestType: getRequest, params: '');
    BasicListModel occupations = basicListModelFromJson(response.body);
    return occupations;
  }

  Future<BasicListModel> getCountryStates({required String countryCode}) async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getBenStates,
        requestType: getRequest,
        params: '?cntry=$countryCode');
    BasicListModel countryStates = basicListModelFromJson(response.body);
    return countryStates;
  }
  Future<BasicListModel> getCities({required String countryCode}) async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getBenCities,
        requestType: getRequest,
        params: '?cntry=$countryCode');
    BasicListModel countryStates = basicListModelFromJson(response.body);
    return countryStates;
  }
  Future<bool> addBeneficiaries(var params)async{
    final response = await _service.httpRequest(
        endPoint: EndPoints.addEditBeneficiaries, requestType: postRequest, params: '', requestBody: params);
    var jsonResponse = json.decode(response.body);
    if(jsonResponse['status'] == true) {
      return true;
    }else{
      showSnackBar("${jsonResponse['message']}");
      return false;
    }
  }
}