import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:restaurantes/core/models/restaurant.dart';
class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const CardRestaurant({required this.restaurant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: restaurant.logo,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
        Text(restaurant.name),
        Text(restaurant.description),
      ],
    );
  }
}
