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
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "timestamp": timestamp?.toIso8601String(),
  };
}

class RemittanceData {
  int? transId;
  DateTime? trDate;
  int? corrId;
  String? corrAgencyCode;
  int? senderId;
  int? beneficiaryId;
  String? sendingCity;
  int? purpose;
  String? purposeDescription;
  int? sourceOfIncome;
  dynamic sourceOfIncomeDescription;
  String? payoutCurrency;
  dynamic payoutAmount;
  dynamic exchRate;
  dynamic totalAmount;
  dynamic ramadCommision;
  dynamic receiverModeOfPayment;
  String? remarks;
  dynamic senderAccountNo;
  dynamic senderAccountTitle;
  dynamic senderAccountCurrency;
  dynamic beneficiaryAccountNo;
  dynamic beneficiaryAccountTitle;
  dynamic beneficiaryAccountCurrency;
  dynamic beneficiaryBankName;
  dynamic beneficiaryBankAddress;
  String? beneficiarySwiftCode;
  String? beneficiaryBranchName;
  String? beneficaryBankCountry;
  dynamic beneficiaryIfsc;
  String? corrTrRefrenace;
  String? corrTrStatus;
  dynamic senderModeOfPayment;
  dynamic payToken;
  dynamic statusText;

  RemittanceData({
    this.transId,
    this.trDate,
    this.corrId,
    this.corrAgencyCode,
    this.senderId,
    this.beneficiaryId,
    this.sendingCity,
    this.purpose,
    this.purposeDescription,
    this.sourceOfIncome,
    this.sourceOfIncomeDescription,
    this.payoutCurrency,
    this.payoutAmount,
    this.exchRate,
    this.totalAmount,
    this.ramadCommision,
    this.receiverModeOfPayment,
    this.remarks,
    this.senderAccountNo,
    this.senderAccountTitle,
    this.senderAccountCurrency,
    this.beneficiaryAccountNo,
    this.beneficiaryAccountTitle,
    this.beneficiaryAccountCurrency,
    this.beneficiaryBankName,
    this.beneficiaryBankAddress,
    this.beneficiarySwiftCode,
    this.beneficiaryBranchName,
    this.beneficaryBankCountry,
    this.beneficiaryIfsc,
    this.corrTrRefrenace,
    this.corrTrStatus,
    this.senderModeOfPayment,
    this.payToken,
    this.statusText,
  });

  factory RemittanceData.fromJson(Map<String, dynamic> json) => RemittanceData(
    transId: json["TransId"],
    trDate: json["TrDate"] == null ? null : DateTime.parse(json["TrDate"]),
    corrId: json["CorrId"],
    corrAgencyCode: json["CorrAgencyCode"],
    senderId: json["SenderId"],
    beneficiaryId: json["BeneficiaryId"],
    sendingCity: json["SendingCity"],
    purpose: json["Purpose"],
    purposeDescription: json["PurposeDescription"],
    sourceOfIncome: json["SourceOfIncome"],
    sourceOfIncomeDescription: json["SourceOfIncomeDescription"],
    payoutCurrency: json["PayoutCurrency"],
    payoutAmount: json["PayoutAmount"],
    exchRate: json["ExchRate"],
    totalAmount: json["TotalAmount"],
    ramadCommision: json["RamadCommision"],
    receiverModeOfPayment: json["ReceiverModeOfPayment"],
    remarks: json["Remarks"],
    senderAccountNo: json["SenderAccountNo"],
    senderAccountTitle: json["SenderAccountTitle"],
    senderAccountCurrency: json["SenderAccountCurrency"],
    beneficiaryAccountNo: json["BeneficiaryAccountNo"],
    beneficiaryAccountTitle: json["BeneficiaryAccountTitle"],
    beneficiaryAccountCurrency: json["BeneficiaryAccountCurrency"],
    beneficiaryBankName: json["BeneficiaryBankName"],
    beneficiaryBankAddress: json["BeneficiaryBankAddress"],
    beneficiarySwiftCode: json["BeneficiarySwiftCode"],
    beneficiaryBranchName: json["BeneficiaryBranchName"],
    beneficaryBankCountry: json["BeneficaryBankCountry"],
    beneficiaryIfsc: json["BeneficiaryIFSC"],
    corrTrRefrenace: json["CorrTrRefrenace"],
    corrTrStatus: json["CorrTrStatus"],
    senderModeOfPayment: json["SenderModeOfPayment"],
    payToken: json["PayToken"],
    statusText: json["StatusText"],
  );

  Map<String, dynamic> toJson() => {
    "TransId": transId,
    "TrDate": trDate?.toIso8601String(),
    "CorrId": corrId,
    "CorrAgencyCode": corrAgencyCode,
    "SenderId": senderId,
    "BeneficiaryId": beneficiaryId,
    "SendingCity": sendingCity,
    "Purpose": purpose,
    "PurposeDescription": purposeDescription,
    "SourceOfIncome": sourceOfIncome,
    "SourceOfIncomeDescription": sourceOfIncomeDescription,
    "PayoutCurrency": payoutCurrency,
    "PayoutAmount": payoutAmount,
    "ExchRate": exchRate,
    "TotalAmount": totalAmount,
    "RamadCommision": ramadCommision,
    "ReceiverModeOfPayment": receiverModeOfPayment,
    "Remarks": remarks,
    "SenderAccountNo": senderAccountNo,
    "SenderAccountTitle": senderAccountTitle,
    "SenderAccountCurrency": senderAccountCurrency,
    "BeneficiaryAccountNo": beneficiaryAccountNo,
    "BeneficiaryAccountTitle": beneficiaryAccountTitle,
    "BeneficiaryAccountCurrency": beneficiaryAccountCurrency,
    "BeneficiaryBankName": beneficiaryBankName,
    "BeneficiaryBankAddress": beneficiaryBankAddress,
    "BeneficiarySwiftCode": beneficiarySwiftCode,
    "BeneficiaryBranchName": beneficiaryBranchName,
    "BeneficaryBankCountry": beneficaryBankCountry,
    "BeneficiaryIFSC": beneficiaryIfsc,
    "CorrTrRefrenace": corrTrRefrenace,
    "CorrTrStatus": corrTrStatus,
    "SenderModeOfPayment": senderModeOfPayment,
    "PayToken": payToken,
    "StatusText": statusText,
  };
}
