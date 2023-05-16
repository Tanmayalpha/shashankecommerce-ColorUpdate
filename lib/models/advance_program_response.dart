// To parse this JSON data, do
//
//     final addvanceProgramResponse = addvanceProgramResponseFromJson(jsonString);

import 'dart:convert';

AdvanceProgramResponse advanceProgramResponseFromJson(String str) => AdvanceProgramResponse.fromJson(json.decode(str));

String advanceProgramResponseToJson(AdvanceProgramResponse data) => json.encode(data.toJson());

class AdvanceProgramResponse {
  AdvanceProgramResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<AdvanceProgaramDataList>? data;

  factory AdvanceProgramResponse.fromJson(Map<String, dynamic> json) => AdvanceProgramResponse(
    error: json["error"],
    message: json["message"],
    data: List<AdvanceProgaramDataList>.from(json["data"].map((x) => AdvanceProgaramDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AdvanceProgaramDataList {
  AdvanceProgaramDataList({
    this.id,
    this.title,
    this.description,
    this.shortDescription,
    this.image,
  });

  String? id;
  String? title;
  String? description;
  String? shortDescription;
  String? image;

  factory AdvanceProgaramDataList.fromJson(Map<String, dynamic> json) => AdvanceProgaramDataList(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    shortDescription: json["short_description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "short_description": shortDescription,
    "image": image,
  };
}
