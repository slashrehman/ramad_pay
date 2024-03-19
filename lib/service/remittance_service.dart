import '../helpers/api_base_helpers.dart';
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

  Future<RemittanceLookUpValues> getLookUpValues() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getRemittanceLookupValues,
        requestType: getRequest,
        params: '');
    RemittanceLookUpValues remittanceLookUpValues = remittanceLookUpValuesFromJson(response.body);
    return remittanceLookUpValues;
  }
}