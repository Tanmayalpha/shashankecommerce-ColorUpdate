// To parse this JSON data, do
//
//     final updateUserResponse = updateUserResponseFromJson(jsonString);

import 'dart:convert';

UpdateUserResponse updateUserResponseFromJson(String str) => UpdateUserResponse.fromJson(json.decode(str));

String updateUserResponseToJson(UpdateUserResponse data) => json.encode(data.toJson());

class UpdateUserResponse {
  UpdateUserResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<UpdateProfileDataList>? data;

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) => UpdateUserResponse(
    error: json["error"],
    message: json["message"],
    data: List<UpdateProfileDataList>.from(json["data"].map((x) => UpdateProfileDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UpdateProfileDataList {
  UpdateProfileDataList({
    this.id,
    this.ipAddress,
    this.username,
    this.password,
    this.email,
    this.mobile,
    this.image,
    this.balance,

    this.createdOn,
    this.lastLogin,
    this.active,
    this.company,
    this.address,
    this.cashReceived,
    this.countryCode,
    this.city,
    this.area,

    this.referralCode,
    this.fcmId,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.imageSm,
  });

  String? id;
  String? ipAddress;
  String? username;
  String? password;
  String? email;
  String? mobile;
  String? image;
  String? balance;

  String? createdOn;
  String? lastLogin;
  String? active;
  String? company;
  String? address;
  String? cashReceived;
  String? countryCode;
  String? city;
  String? area;

  String? referralCode;
  String? fcmId;
  String? latitude;
  String? longitude;
  DateTime? createdAt;
  String? imageSm;

  factory UpdateProfileDataList.fromJson(Map<String, dynamic> json) => UpdateProfileDataList(
    id: json["id"],
    ipAddress: json["ip_address"],
    username: json["username"],
    password: json["password"],
    email: json["email"],
    mobile: json["mobile"],
    image: json["image"],
    balance: json["balance"],

    createdOn: json["created_on"],
    lastLogin: json["last_login"],
    active: json["active"],
    company: json["company"],
    address: json["address"],
    cashReceived: json["cash_received"],
    countryCode: json["country_code"],
    city: json["city"],
    area: json["area"],

    referralCode: json["referral_code"],
    fcmId: json["fcm_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdAt: DateTime.parse(json["created_at"]),
    imageSm: json["image_sm"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ip_address": ipAddress,
    "username": username,
    "password": password,
    "email": email,
    "mobile": mobile,
    "image": image,
    "balance": balance,

    "created_on": createdOn,
    "last_login": lastLogin,
    "active": active,
    "company": company,
    "address": address,

    "cash_received": cashReceived,

    "country_code": countryCode,
    "city": city,
    "area": area,

    "referral_code": referralCode,
    "fcm_id": fcmId,
    "latitude": latitude,
    "longitude": longitude,
    "created_at": createdAt!.toIso8601String(),
    "image_sm": imageSm,
  };
}
