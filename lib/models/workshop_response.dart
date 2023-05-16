// To parse this JSON data, do
//
//     final workshopDataResponse = workshopDataResponseFromJson(jsonString);

import 'dart:convert';

WorkshopDataResponse workshopDataResponseFromJson(String str) => WorkshopDataResponse.fromJson(json.decode(str));

String workshopDataResponseToJson(WorkshopDataResponse data) => json.encode(data.toJson());

class WorkshopDataResponse {
  WorkshopDataResponse({
    this.error,
    this.data,
  });

  bool? error;
  List<WorkshopDataList>? data;

  factory WorkshopDataResponse.fromJson(Map<String, dynamic> json) => WorkshopDataResponse(
    error: json["error"],
    data: List<WorkshopDataList>.from(json["data"].map((x) => WorkshopDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "data": List<WorkshopDataList>.from(data!.map((x) => x.toJson())),
  };
}

class WorkshopDataList {
  WorkshopDataList({
    this.id,
    this.title,
    this.description,
    this.image,
    this.shortDescription,
    this.video,
    this.price
  });

  String? id;
  String? title;
  String? description;
  String? image;
  String? shortDescription;
  String? video;
  String? price;

  factory WorkshopDataList.fromJson(Map<String, dynamic> json) => WorkshopDataList(
    id: json["id"],
    shortDescription: json["short_description"],
    video: json["video"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video": video,
    "short_description": shortDescription,
    "title": title,
    "description": description,
    "image": image,
    "price": price,
  };
}
