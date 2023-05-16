// To parse this JSON data, do
//
//     final loginUserResponse = loginUserResponseFromJson(jsonString);

import 'dart:convert';

LoginUserResponse loginUserResponseFromJson(String str) => LoginUserResponse.fromJson(json.decode(str));

String loginUserResponseToJson(LoginUserResponse data) => json.encode(data.toJson());

class LoginUserResponse {
  LoginUserResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<LoginUserData>? data;

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) => LoginUserResponse(
    error: json["error"],
    message: json["message"],
    data: List<LoginUserData>.from(json["data"].map((x) => LoginUserData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class LoginUserData {
  LoginUserData({
    this.id,
    this.ipAddress,
    this.username,
    this.email,
    this.mobile,
    this.image,
    this.balance,
    this.activationSelector,
    this.activationCode,

    this.createdOn,
    this.lastLogin,
    this.active,
    this.cashReceived,
    this.countryCode,

  });

  String? id;
  String? ipAddress;
  String? username;
  String? email;
  String? mobile;
  String? image;
  String? balance;
  String? activationSelector;
  String? activationCode;

  String?createdOn;
  String?lastLogin;
  String?active;

  String? cashReceived;
  String? countryCode;

  DateTime? createdAt;

  factory LoginUserData.fromJson(Map<String, dynamic> json) => LoginUserData(
    id: json["id"],
    ipAddress: json["ip_address"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    image: json["image"],
    balance: json["balance"],
    activationSelector: json["activation_selector"],
    activationCode: json["activation_code"],

    createdOn: json["created_on"],
    lastLogin: json["last_login"],
    active: json["active"],

    cashReceived: json["cash_received"],

    countryCode: json["country_code"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ip_address": ipAddress,
    "username": username,
    "email": email,
    "mobile": mobile,
    "image": image,
    "balance": balance,
    "activation_selector": activationSelector,
    "activation_code": activationCode,

    "created_on": createdOn,
    "last_login": lastLogin,
    "active": active,

    "cash_received": cashReceived,
    "country_code": countryCode,
    "created_at": createdAt!.toIso8601String(),
  };
}
