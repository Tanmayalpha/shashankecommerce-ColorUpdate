// To parse this JSON data, do
//
//     final registerUserResponse = registerUserResponseFromJson(jsonString);

import 'dart:convert';

RegisterUserResponse registerUserResponseFromJson(String str) => RegisterUserResponse.fromJson(json.decode(str));

String registerUserResponseToJson(RegisterUserResponse data) => json.encode(data.toJson());

class RegisterUserResponse {
  RegisterUserResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<RegisterUserData>? data;

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) => RegisterUserResponse(
    error: json["error"],
    message: json["message"],
    data: List<RegisterUserData>.from(json["data"].map((x) => RegisterUserData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class RegisterUserData {
  RegisterUserData({
    this.id,
    this.username,
    this.email,
    this.mobile,
    this.cityName,
    this.areaName,
  });

  String? id;
  String? username;
  String? email;
  String? mobile;
  String? cityName;
  String? areaName;

  factory RegisterUserData.fromJson(Map<String, dynamic> json) => RegisterUserData(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    cityName: json["city_name"],
    areaName: json["area_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "mobile": mobile,
    "city_name": cityName,
    "area_name": areaName,
  };
}
