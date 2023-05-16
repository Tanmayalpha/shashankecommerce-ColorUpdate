// To parse this JSON data, do
//
//     final resetPasswordResponse = resetPasswordResponseFromJson(jsonString);

import 'dart:convert';

ResetPasswordResponse resetPasswordResponseFromJson(String str) => ResetPasswordResponse.fromJson(json.decode(str));

String resetPasswordResponseToJson(ResetPasswordResponse data) => json.encode(data.toJson());

class ResetPasswordResponse {
  ResetPasswordResponse({
     this.error,
     this.message,
     this.data,
  });

  bool? error;
  String? message;
  List<dynamic>? data;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => ResetPasswordResponse(
    error: json["error"],
    message: json["message"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}
