// To parse this JSON data, do
//
//     final portfolioResponse = portfolioResponseFromJson(jsonString);

import 'dart:convert';

PortfolioResponse portfolioResponseFromJson(String str) => PortfolioResponse.fromJson(json.decode(str));

String portfolioResponseToJson(PortfolioResponse data) => json.encode(data.toJson());

class PortfolioResponse {
  PortfolioResponse({
    this.error,
    this.data,
  });

  bool? error;
  List<PortfolioData>? data;

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) => PortfolioResponse(
    error: json["error"],
    data: List<PortfolioData>.from(json["data"].map((x) => PortfolioData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PortfolioData {
  PortfolioData({
    this.id,
    this.plan,
    this.description,
    this.image,
    this.price,
    this.planType,
    this.shortDescription,
    this.performance,
    this.featured,
    this.stock,
    this.video
  });

  String? id;
  String? plan;
  String? description;
  String? image;
  String? price;
  String? planType;
  String? shortDescription;
  String? performance;
  String? video;
  List<Featured>? featured;
  List<Stock>? stock;

  factory PortfolioData.fromJson(Map<String, dynamic> json) => PortfolioData(
    id: json["id"],
    plan: json["plan"],
    description: json["description"],
    image: json["image"],
    video: json["video"],
    price: json["price"],
    planType: json["plan_type"],
    shortDescription: json["short_description"],
    performance: json["performance"],
    featured: List<Featured>.from(json["featured"].map((x) => Featured.fromJson(x))),
    stock: List<Stock>.from(json["stock"].map((x) => Stock.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video": video,
    "plan": plan,
    "description": description,
    "image": image,
    "price": price,
    "plan_type": planType,
    "short_description": shortDescription,
    "performance": performance,
    "featured": List<dynamic>.from(featured!.map((x) => x.toJson())),
    "stock": List<dynamic>.from(stock!.map((x) => x.toJson())),
  };
}

class Featured {
  Featured({
    this.id,
    this.featuredTitle,
    this.featuredDescription,
  });

  String? id;
  String? featuredTitle;
  String? featuredDescription;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
    id: json["id"],
    featuredTitle: json["featured_title"],
    featuredDescription: json["featured_description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "featured_title": featuredTitle,
    "featured_description": featuredDescription,
  };
}

class Stock {
  Stock({
    this.id,
    this.name,
    this.qty,
    this.price,
    this.portfolioId,
    this.createdAt,
  });

  String? id;
  String? name;
  String? qty;
  String? price;
  String? portfolioId;
  DateTime? createdAt;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
    id: json["id"],
    name: json["name"],
    qty: json["qty"],
    price: json["price"],
    portfolioId: json["portfolio_id"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "qty": qty,
    "price": price,
    "portfolio_id": portfolioId,
    "created_at": createdAt!.toIso8601String(),
  };
}
