// To parse this JSON data, do
//
//     final advancedProgramVideoResponse = advancedProgramVideoResponseFromJson(jsonString);

import 'dart:convert';

AdvancedProgramVideoResponse advancedProgramVideoResponseFromJson(String str) => AdvancedProgramVideoResponse.fromJson(json.decode(str));

String advancedProgramVideoResponseToJson(AdvancedProgramVideoResponse data) => json.encode(data.toJson());

class AdvancedProgramVideoResponse {
  bool? error;
  String? message;
  List<AdvanceProgramVideoData>? data;

  AdvancedProgramVideoResponse({
    this.error,
    this.message,
    this.data,
  });

  factory AdvancedProgramVideoResponse.fromJson(Map<String, dynamic> json) => AdvancedProgramVideoResponse(
    error: json["error"],
    message: json["message"],
    data: List<AdvanceProgramVideoData>.from(json["data"].map((x) => AdvanceProgramVideoData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AdvanceProgramVideoData {
  String? id;
  String? programId;
  String? title;
  String? description;
  String? video;
  String? status;

  AdvanceProgramVideoData({
    this.id,
    this.programId,
    this.title,
    this.description,
    this.video,
    this.status,
  });

  factory AdvanceProgramVideoData.fromJson(Map<String, dynamic> json) => AdvanceProgramVideoData(
    id: json["id"],
    programId: json["program_id"],
    title: json["title"],
    description: json["description"],
    video: json["video"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "program_id": programId,
    "title": title,
    "description": description,
    "video": video,
    "status": status,
  };
}
