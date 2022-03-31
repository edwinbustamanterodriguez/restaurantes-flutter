
import 'package:get_time_ago/get_time_ago.dart';

class Review {
  String slug;
  String restaurant;
  String email;
  String comments;
  int rating;
  DateTime created;

  Review({
    required this.slug,
    required this.restaurant,
    required this.email,
    required this.comments,
    required this.rating,
    required this.created,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    slug: json["slug"],
    restaurant: json["restaurant"],
    email: json["email"],
    comments: json["comments"],
    rating: json["rating"],
    created: DateTime.parse(json["created"]),
  );

  String getTimeAgo(){
    return GetTimeAgo.parse(created);
  }

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "restaurant": restaurant,
    "email": email,
    "comments": comments,
    "rating": rating,
    "created": created.toIso8601String(),
  };
}
