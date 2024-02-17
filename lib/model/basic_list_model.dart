
class DataModel {
  String key;
  String value;

  DataModel({
    required this.key,
    required this.value,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    key: json["key"],
    value: json["value"],
  );
}