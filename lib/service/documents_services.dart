import 'dart:convert';

import 'package:ramad_pay/model/base_response_model.dart';

import '../helpers/api_base_helpers.dart';
import '../model/states_model.dart';
import '../utils/end_points.dart';

class DocumentsService{
  final ApiBaseHelper _service = ApiBaseHelper();

  Future<BasicListModel> getDocumentsTypes() async {
    final response = await _service.httpRequest(
        endPoint: EndPoints.getDocumentsType, requestType: getRequest, params: '');
    BasicListModel occupations = basicListModelFromJson(response.body);
    return occupations;
  }

  Future<bool> uploadDocuments({requestBody, filePath}) async {
    final response = await _service.httpRequest(
      endPoint: EndPoints.uploadUserDocuments,
      requestType: filePath.path == '' ? postRequest : multipartRequest,
      params: '',
      requestBody: requestBody,
      filePath: filePath,
    );
    var jsonResponse = json.decode(response.body);
    if(jsonResponse['status'] == true) {
      return true;
    }else{
      return false;
    }
    // BaseResponseModel baseResponse = baseResponseModel(response.body);
    // return baseResponse;
  }
}