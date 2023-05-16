// To parse this JSON data, do
//
//     final checkSubscriptionResponse = checkSubscriptionResponseFromJson(jsonString);

import 'dart:convert';

CheckSubscriptionResponse checkSubscriptionResponseFromJson(String str) => CheckSubscriptionResponse.fromJson(json.decode(str));

String checkSubscriptionResponseToJson(CheckSubscriptionResponse data) => json.encode(data.toJson());

class CheckSubscriptionResponse {
  CheckSubscriptionResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<CheckSubscriptionData>? data;

  factory CheckSubscriptionResponse.fromJson(Map<String, dynamic> json) => CheckSubscriptionResponse(
    error: json["error"],
    message: json["message"],
    data: List<CheckSubscriptionData>.from(json["data"].map((x) => CheckSubscriptionData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CheckSubscriptionData {
  CheckSubscriptionData({
    this.id,
    this.userId,
    this.portfolioId,
    this.startDate,
    this.endDate,
    this.type,
  });

  String? id;
  String? userId;
  String? portfolioId;
  String? type;
  DateTime? startDate;
  String? endDate;

  factory CheckSubscriptionData.fromJson(Map<String, dynamic> json) => CheckSubscriptionData(
    id: json["id"],
    userId: json["user_id"],
    type: json["plan_type"],
    portfolioId: json["portfolio_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: json["end_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plan_type": type,
    "user_id": userId,
    "portfolio_id": portfolioId,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": endDate,
  };
}
