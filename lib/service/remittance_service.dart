import '../helpers/api_base_helpers.dart';
import '../model/states_model.dart';
import '../utils/end_points.dart';

class RemittanceService{

  final ApiBaseHelper _service = ApiBaseHelper();

  Future<BasicListModel> getBenKeyValues() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getBenKeyValue,
        requestType: getRequest,
        params: '');
    BasicListModel countryStates = basicListModelFromJson(response.body);
    return countryStates;
  }
}