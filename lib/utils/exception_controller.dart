import 'package:get/get.dart';

class ExceptionController extends GetxController {
  RxBool _isException = false.obs;
  final List<Function> _fetchData = <Function>[].obs;

  List<Function> get getFetchData => _fetchData;

  RxBool get getIsException => _isException;

  void addFetchData(Function value) {
    _fetchData.add(value);
  }

  void setIsException(bool value) {
    _isException.value = value;
  }

  void callFutureListData() async {
    /*List<dynamic> results =*/ //await Future.wait(_fetchData);
    // Process the results

    for (final Function function in _fetchData) {
      function();
    }
  }
}