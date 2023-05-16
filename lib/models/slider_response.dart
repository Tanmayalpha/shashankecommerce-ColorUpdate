// To parse this JSON data, do
//
//     final sliderResponse = sliderResponseFromJson(jsonString);

import 'dart:convert';

SliderResponse sliderResponseFromJson(String str) => SliderResponse.fromJson(json.decode(str));

String sliderResponseToJson(SliderResponse data) => json.encode(data.toJson());

class SliderResponse {
  SliderResponse({
    this.error,
    this.data,
  });

  bool? error;
  List<SliderData>? data;

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
    error: json["error"],
    data: List<SliderData>.from(json["data"].map((x) => SliderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SliderData {
  SliderData({
    this.id,
    this.type,
    this.typeId,
    this.image,
    this.dateAdded,
    this.data,
  });

  String? id;
  String? type;
  String? typeId;
  String? image;
  DateTime? dateAdded;
  List<String>? data;

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
    id: json["id"],
    type: json["type"],
    typeId: json["type_id"],
    image: json["image"],
    dateAdded: DateTime.parse(json["date_added"]),
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "type_id": typeId,
    "image": image,
    "date_added": dateAdded!.toIso8601String(),
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}
