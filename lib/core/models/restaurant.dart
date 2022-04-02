import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurantes/core/models/review.dart';

class Restaurant {
  String? slug;
  String name;
  String description;
  String? logo;
  double? rating;
  List<String> foodType;
  List<Review>? reviews;
  XFile? image;

  Restaurant({
    this.slug,
    this.image,
    required this.name,
    required this.description,
    this.logo,
    this.rating,
    required this.foodType,
    this.reviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"] ??
            "https://upload.wikimedia.org/wikipedia/commons/e/ef/Restaurant_N%C3%A4sinneula.jpg",
        rating: json["rating"] ?? 0.0,
        foodType: List<String>.from(json["food_type"].map((x) => x)),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, Object?> toJson() {
    return {
      "name": name,
      "description": description,
      "food_type": foodType,
    };
  }

  static List<Restaurant> listFromJson(list) =>
      List<Restaurant>.from(list.map((x) => Restaurant.fromJson(x)));

  static Restaurant fromJson2(x) => Restaurant.fromJson(x);
}

List<Restaurant> restaurantsFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restaurantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
