import 'dart:convert';

class FoodType {
  String slug;
  String name;

  FoodType({
    required this.slug,
    required this.name,
  });

  factory FoodType.fromJson(Map<String, dynamic> json) => FoodType(
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };

  static List<FoodType> listFromJson(list) => List<FoodType>.from(list.map((x) => FoodType.fromJson(x)));
}

String foodTypeToJson(List<FoodType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
