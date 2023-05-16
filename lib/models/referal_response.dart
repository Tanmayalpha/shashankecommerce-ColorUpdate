// To parse this JSON data, do
//
//     final referalResponse = referalResponseFromJson(jsonString);

import 'dart:convert';

ReferalResponse referalResponseFromJson(String str) => ReferalResponse.fromJson(json.decode(str));

String referalResponseToJson(ReferalResponse data) => json.encode(data.toJson());

class ReferalResponse {
  ReferalResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  ReferalData? data;

  factory ReferalResponse.fromJson(Map<String, dynamic> json) => ReferalResponse(
    error: json["error"],
    message: json["message"],
    data: ReferalData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class ReferalData {
  ReferalData({
    this.referralCode,
    this.amount
  });

  String? referralCode;
  String? amount;

  factory ReferalData.fromJson(Map<String, dynamic> json) => ReferalData(
    referralCode: json["referral_code"],
    amount: json["reffer_amt"],
  );

  Map<String, dynamic> toJson() => {
    "referral_code": referralCode,
    "reffer_amt": amount,
  };
}
