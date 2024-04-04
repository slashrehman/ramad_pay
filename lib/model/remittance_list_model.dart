import 'dart:convert';

RemittanceListModel remittanceListModelFromJson(String str) => RemittanceListModel.fromJson(json.decode(str));

String remittanceListModelToJson(RemittanceListModel data) => json.encode(data.toJson());

class RemittanceListModel {
  bool? status;
  String? message;
  List<RemittanceData>? data;
  DateTime? timestamp;

  RemittanceListModel({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  factory RemittanceListModel.fromJson(Map<String, dynamic> json) => RemittanceListModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<RemittanceData>.from(json["data"]!.map((x) => RemittanceData.fromJson(x))),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "timestamp": timestamp?.toIso8601String(),
  };
}

class RemittanceData {
  int? transId;
  DateTime? trDate;
  String? benName;
  String? country;
  String? mobile;
  dynamic amount;
  String? payoutCurrency;
  dynamic payoutAmount;
  dynamic exchRate;

  RemittanceData({
    this.transId,
    this.trDate,
    this.benName,
    this.country,
    this.mobile,
    this.amount,
    this.payoutCurrency,
    this.payoutAmount,
    this.exchRate,
  });

  factory RemittanceData.fromJson(Map<String, dynamic> json) => RemittanceData(
    transId: json["TransId"],
    trDate: json["TrDate"] == null ? null : DateTime.parse(json["TrDate"]),
    benName: json["BenName"],
    country: json["Country"],
    mobile: json["Mobile"],
    amount: json["Amount"]?.toDouble(),
    payoutCurrency: json["PayoutCurrency"],
    payoutAmount: json["PayoutAmount"],
    exchRate: json["ExchRate"]?.toDouble(),
  );
}

// enum BenName {
//   ABDUL_KOTTLUNGAL,
//   ABDUL_RAHMAN,
//   ALI_MOSMED
// }
//
// final benNameValues = EnumValues({
//   "Abdul Kottlungal": BenName.ABDUL_KOTTLUNGAL,
//   "Abdul Rahman": BenName.ABDUL_RAHMAN,
//   "Ali Mosmed": BenName.ALI_MOSMED
// });
//
// enum Country {
//   UNITED_ARAB_EMIRATES,
//   UNITED_STATES
// }
//
// final countryValues = EnumValues({
//   "UNITED ARAB EMIRATES": Country.UNITED_ARAB_EMIRATES,
//   "UNITED STATES": Country.UNITED_STATES
// });
//
// enum PayoutCurrency {
//   AED,
//   USD
// }
//
// final payoutCurrencyValues = EnumValues({
//   "AED": PayoutCurrency.AED,
//   "USD": PayoutCurrency.USD
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
