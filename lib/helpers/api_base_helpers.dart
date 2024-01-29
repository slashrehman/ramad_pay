import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ramad_pay/helpers/shared_pref_helper.dart';
import '../utils/print_console.dart';
import '../utils/remote_data.dart';
import '../utils/end_points.dart';
import '../utils/exception_controller.dart';
import '../widgets/no_internet_view.dart';

const String postRequest = 'POST';
const String getRequest = 'GET';
const String putRequest = 'PUT';
const String patchRequest = 'PATCH';
const String deleteRequest = "DELETE";
const String multipartRequest = "MULTIPART";

class ApiBaseHelper {


  final SharedPref _sharedPref = SharedPref();
  final exceptionController = Get.put(ExceptionController());
  Future<dynamic> httpRequest(
      {required EndPoints endPoint,
        required String requestType,
        var requestBody,
        File? filePath,
        required String params}) async {
    printInConsole(data: '$requestType : ${endPoint.url} ${jsonEncode(requestBody)}');
    var token = await _sharedPref.readString(_sharedPref.tokenKey??"");
    try {
      final headers = getHeaders(token: token);
      printInConsole(data:
          "Request -> $requestType -> ${Uri.parse(liveBaseUrl+ endPoint.url + params)}");
      printInConsole(data:"headers -> $headers");
      switch (requestType) {
        case getRequest:
          final responseJson = await http.get(
            Uri.parse(liveBaseUrl + endPoint.url + params),
            headers: headers,
          );
          printInConsole(data:"${responseJson.statusCode} -> ${responseJson.request?.url}");
          printInConsole(data:
              "Response -> ${responseJson.statusCode} -> ${responseJson.body}");
          removeException();
          return responseJson;

        case postRequest:
          final responseJson = await http.post(
              Uri.parse(liveBaseUrl + endPoint.url),
              headers: headers,
              body: jsonEncode(requestBody));
          printInConsole(data:
              "Response -> ${responseJson.statusCode} -> ${responseJson.body}");

          return responseJson;

        case multipartRequest:
          final request = http.MultipartRequest(
              'POST', Uri.parse(liveBaseUrl + endPoint.url));
          request.fields.addAll(requestBody);
          request.headers.addAll(headers);
          request.files
              .add(await http.MultipartFile.fromPath("image", filePath!.path));
          http.StreamedResponse responseJson = await request.send();

          var streamedResponse = await http.Response.fromStream(responseJson);
          printInConsole(data: streamedResponse.body);
          removeException();

          return streamedResponse;

        case putRequest:
          final responseJson = await http.put(
              Uri.parse(liveBaseUrl + endPoint.url),
              headers: headers,
              body: jsonEncode(requestBody));
          printInConsole(data:
              "Response -> ${responseJson.statusCode} -> ${responseJson.body}");
          removeException();

          return responseJson;

        case deleteRequest:
          final responseJson = await http.delete(
              Uri.parse(liveBaseUrl + endPoint.url + params),
              headers: headers /*,
              body: jsonEncode(requestBody)*/
          );
          printInConsole(data: "Response -> ${responseJson.statusCode} -> ${responseJson.body}");
          removeException();

          return responseJson;
      }
    } on SocketException {
      if (exceptionController.getIsException.value) {
        NoInterNetConnectionView(
          callback: () {
            Get.back();
            exceptionController.setIsException(false);
            exceptionController.callFutureListData();
          },
        );
      }
    }
    catch (e) {
      printInConsole(data:e.toString());
    }
  }

  Map<String, String> getHeaders({required String? token}) {
    Map<String, String> headers = {};
    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('x-auth-token', () => token ?? '');
    return headers;
  }

  void removeException() {
    exceptionController.setIsException(false);
    exceptionController.getFetchData.clear();
  }
}