import 'package:ramad_pay/model/base_response_model.dart';
import 'package:ramad_pay/model/get_paymode_currency_model.dart';

import '../helpers/api_base_helpers.dart';
import '../model/basic_list_model.dart';
import '../model/remittance_list_model.dart';
import '../model/remittance_lookup_values.dart';
import '../model/states_model.dart';
import '../utils/end_points.dart';

class RemittanceService{

  final ApiBaseHelper _service = ApiBaseHelper();
  Future<RemittanceListModel> getRemittanceList() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getRemittanceList,
        requestType: getRequest,
        params: '');
    RemittanceListModel remittanceListModel = remittanceListModelFromJson(response.body);
    return remittanceListModel;
  }

  Future<BasicListModel> getBenKeyValues() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getBenKeyValue,
        requestType: getRequest,
        params: '');
    BasicListModel data = basicListModelFromJson(response.body);
    return data;
  }
  Future<List<DataModel>> getBenSendingCity(String benId) async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getBenSendingCity,
        requestType: getRequest,
        params: 'benId=$benId');
    List<DataModel> data = dataModelListModelFromJson(response.body);
    return data;
  }

  Future<BasicListModel> getAgencyCode(String city) async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getAgencyCode,
        requestType: getRequest,
        params: 'city=$city');
    BasicListModel data = basicListModelFromJson(response.body);
    return data;
  }
  Future<GetPayModeCurrencyModel> getPayModeCurrency(String agnt) async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getPayModeCurrency,
        requestType: getRequest,
        params: 'agnt=$agnt');
    GetPayModeCurrencyModel data = getPayModeCurrencyModelFromJson(response.body);
    return data;
  }

  Future<RemittanceLookUpValues> getLookUpValues() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getRemittanceLookupValues,
        requestType: getRequest,
        params: '');
    RemittanceLookUpValues remittanceLookUpValues = remittanceLookUpValuesFromJson(response.body);
    return remittanceLookUpValues;
  }

  Future<BaseResponseModel> postRemittance(var data)async{
    final response = await _service.httpRequest(
        endPoint: EndPoints.addEditRemittance,
        requestType: postRequest,
        requestBody: data,
        params: '');
    BaseResponseModel  responseModel = baseResponseModel(response.body);
    return responseModel;
  }
}