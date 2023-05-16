// To parse this JSON data, do
//
//     final programResponse = programResponseFromJson(jsonString);

import 'dart:convert';

ProgramResponse programResponseFromJson(String str) => ProgramResponse.fromJson(json.decode(str));

String programResponseToJson(ProgramResponse data) => json.encode(data.toJson());

class ProgramResponse {
  ProgramResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<ProgramDataList>? data;

  factory ProgramResponse.fromJson(Map<String, dynamic> json) => ProgramResponse(
    error: json["error"],
    message: json["message"],
    data: List<ProgramDataList>.from(json["data"].map((x) => ProgramDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<ProgramDataList>.from(data!.map((x) => x.toJson())),
  };
}

class ProgramDataList {
  ProgramDataList({
    this.id,
    this.title,
    this.description,
    this.shortDescription,
    this.pdf,
    this.video, this.image,
  });

  String? id;
  String? title;
  String? description;
  String? shortDescription;
  String? pdf;
  String? video;
  String? image;

  factory ProgramDataList.fromJson(Map<String, dynamic> json) => ProgramDataList(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    shortDescription: json["short_description"],
    pdf: json["pdf"],
    video: json["video"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "short_description": shortDescription,
    "pdf": pdf,
    "video": video,
    "image": image,
  };
}
