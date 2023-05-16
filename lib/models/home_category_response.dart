// To parse this JSON data, do
//
//     final homeCategoryResponse = homeCategoryResponseFromJson(jsonString);

import 'dart:convert';

HomeCategoryResponse homeCategoryResponseFromJson(String str) => HomeCategoryResponse.fromJson(json.decode(str));

String homeCategoryResponseToJson(HomeCategoryResponse data) => json.encode(data.toJson());

class HomeCategoryResponse {
  HomeCategoryResponse({
    this.message,
    this.error,
    this.total,
    this.data,
  });

  String? message;
  bool? error;
  int? total;
  List<HomeCategoryData>? data;

  factory HomeCategoryResponse.fromJson(Map<String, dynamic> json) => HomeCategoryResponse(
    message: json["message"],
    error: json["error"],
    total: json["total"],
    data: List<HomeCategoryData>.from(json["data"].map((x) => HomeCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "total": total,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class HomeCategoryData {
  HomeCategoryData({
    this.id,
    this.name,
    this.parentId,
    this.slug,
    this.image,
    this.banner,
    this.rowOrder,
    this.status,
    this.clicks,
    this.text,
    this.state,
    this.icon,
    this.level,
    this.total,
  });

  String? id;
  String? name;
  String? parentId;
  String? slug;
  String? image;
  String? banner;
  String? rowOrder;
  String? status;
  String? clicks;
  String? text;
  State? state;
  String? icon;
  int? level;
  int? total;

  factory HomeCategoryData.fromJson(Map<String, dynamic> json) => HomeCategoryData(
    id: json["id"],
    name: json["name"],
    parentId: json["parent_id"],
    slug: json["slug"],
    image: json["image"],
    banner: json["banner"],
    rowOrder: json["row_order"],
    status: json["status"],
    clicks: json["clicks"],
    text: json["text"],
    state: State.fromJson(json["state"]),
    icon: json["icon"],
    level: json["level"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parent_id": parentId,
    "slug": slug,
    "image": image,
    "banner": banner,
    "row_order": rowOrder,
    "status": status,
    "clicks": clicks,
    "text": text,
    "state": state!.toJson(),
    "icon": icon,
    "level": level,
    "total": total,
  };
}

class State {
  State({
    this.opened,
  });

  bool? opened;

  factory State.fromJson(Map<String, dynamic> json) => State(
    opened: json["opened"],
  );

  Map<String, dynamic> toJson() => {
    "opened": opened,
  };
}
