import 'dart:convert';

import 'package:restaurantes/core/models/review.dart';

class Restaurant {
  String slug;
  String name;
  String description;
  String logo;
  double rating;
  List<String> foodType;
  List<Review> reviews;

  Restaurant({
    required this.slug,
    required this.name,
    required this.description,
    required this.logo,
    required this.rating,
    required this.foodType,
    required this.reviews,
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

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "description": description,
        "logo": logo,
        "rating": rating,
        "food_type": List<dynamic>.from(foodType.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };

  static List<Restaurant> listFromJson(list) =>
      List<Restaurant>.from(list.map((x) => Restaurant.fromJson(x)));
}

List<Restaurant> restaurantsFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restaurantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
