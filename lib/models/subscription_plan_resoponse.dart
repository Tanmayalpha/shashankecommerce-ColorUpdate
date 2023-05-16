// To parse this JSON data, do
//
//     final subscriptionPlanResponse = subscriptionPlanResponseFromJson(jsonString);

import 'dart:convert';

SubscriptionPlanResponse subscriptionPlanResponseFromJson(String str) => SubscriptionPlanResponse.fromJson(json.decode(str));

String subscriptionPlanResponseToJson(SubscriptionPlanResponse data) => json.encode(data.toJson());

class SubscriptionPlanResponse {
  SubscriptionPlanResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<SubscriptionPlanData>? data;

  factory SubscriptionPlanResponse.fromJson(Map<String, dynamic> json) => SubscriptionPlanResponse(
    error: json["error"],
    message: json["message"],
    data: List<SubscriptionPlanData>.from(json["data"].map((x) => SubscriptionPlanData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SubscriptionPlanData {
  SubscriptionPlanData({
    this.id,
    this.plan,
    this.image,
    this.status,
    this.planType,
    this.price,
    this.shortDescription,
    this.description,
  });

  String? id;
  String? plan;
  String? image;
  String? status;
  String? planType;
  String? price;
  String? shortDescription;
  String? description;

  factory SubscriptionPlanData.fromJson(Map<String, dynamic> json) => SubscriptionPlanData(
    id: json["id"],
    plan: json["plan"],
    image: json["image"],
    status: json["status"],
    planType: json["plan_type"],
    price: json["price"],
    shortDescription: json["short_description"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plan": plan,
    "image": image,
    "status": status,
    "plan_type": planType,
    "price": price,
    "short_description": shortDescription,
    "description": description,
  };
}
