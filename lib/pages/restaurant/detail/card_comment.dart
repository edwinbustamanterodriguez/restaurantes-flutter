import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:restaurantes/core/models/review.dart';
import 'package:restaurantes/utils/themes/colors.dart';

class CardComment extends StatelessWidget {
  final Review review;
  const CardComment({required this.review,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0,bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: RatingBarIndicator(
                  rating: review.rating.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 18.0,
                  direction: Axis.horizontal,
                ),
              ),
              Text(
                review.getTimeAgo(),
                style: kRestaurantSubtitle,
                textAlign: TextAlign.left,
                maxLines: 3,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              review.comments,
              style: kRestaurantSubtitle,
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            'comment_by'.trParams({'email':review.email}),
            style: kRestaurantComment,
          ),
        ],
      ),
    );
  }
}
