// To parse this JSON data, do
//
//     final disclaimerResponse = disclaimerResponseFromJson(jsonString);

import 'dart:convert';

DisclaimerResponse disclaimerResponseFromJson(String str) => DisclaimerResponse.fromJson(json.decode(str));

String disclaimerResponseToJson(DisclaimerResponse data) => json.encode(data.toJson());

class DisclaimerResponse {
  DisclaimerResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<DisclaimerDataList>? data;

  factory DisclaimerResponse.fromJson(Map<String, dynamic> json) => DisclaimerResponse(
    error: json["error"],
    message: json["message"],
    data: List<DisclaimerDataList>.from(json["data"].map((x) => DisclaimerDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DisclaimerDataList {
  DisclaimerDataList({
    this.id,
    this.title,
  });

  String?  id;
  String?  title;

  factory DisclaimerDataList.fromJson(Map<String, dynamic> json) => DisclaimerDataList(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
