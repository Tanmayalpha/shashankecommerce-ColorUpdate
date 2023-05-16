// To parse this JSON data, do
//
//     final subscribePlanResponse = subscribePlanResponseFromJson(jsonString);

import 'dart:convert';

SubscribePlanResponse subscribePlanResponseFromJson(String str) => SubscribePlanResponse.fromJson(json.decode(str));

String subscribePlanResponseToJson(SubscribePlanResponse data) => json.encode(data.toJson());

class SubscribePlanResponse {
  SubscribePlanResponse({
    this.error,
    this.message,
  });

  bool? error;
  String? message;

  factory SubscribePlanResponse.fromJson(Map<String, dynamic> json) => SubscribePlanResponse(
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };
}
