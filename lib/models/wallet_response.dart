// To parse this JSON data, do
//
//     final wallteResponse = wallteResponseFromJson(jsonString);

import 'dart:convert';

WallteResponse wallteResponseFromJson(String str) => WallteResponse.fromJson(json.decode(str));

String wallteResponseToJson(WallteResponse data) => json.encode(data.toJson());

class WallteResponse {
  WallteResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  WalletData? data;

  factory WallteResponse.fromJson(Map<String, dynamic> json) => WallteResponse(
    error: json["error"],
    message: json["message"],
    data: WalletData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class WalletData {
  WalletData({
    this.balance,
  });

  String? balance;

  factory WalletData.fromJson(Map<String, dynamic> json) => WalletData(
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
  };
}
