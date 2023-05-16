// To parse this JSON data, do
//
//     final inquiryResponse = inquiryResponseFromJson(jsonString);

import 'dart:convert';

InquiryResponse inquiryResponseFromJson(String str) => InquiryResponse.fromJson(json.decode(str));

String inquiryResponseToJson(InquiryResponse data) => json.encode(data.toJson());

class InquiryResponse {
  InquiryResponse({
    this.error,
    this.message,
  });

  bool? error;
  String? message;

  factory InquiryResponse.fromJson(Map<String, dynamic> json) => InquiryResponse(
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };
}
