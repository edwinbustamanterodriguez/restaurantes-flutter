import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/models/review.dart';
import 'package:restaurantes/core/providers/review_provider.dart';

class ReviewController extends GetxController {
  String slug = Get.arguments;
  final ReviewProvider reviewProvider;

  final reviewFormKey = GlobalKey<FormState>();
  final emailFormKey = TextEditingController();
  final commentFormKey = TextEditingController();
  late double rating = 1.0;

  ReviewController({required this.reviewProvider}) {}

  String? validator(String value) {
    if (value.isEmpty) {
      return 'validation_empty'.tr;
    }
    return null;
  }

  String? validatorEmail(String value) {
    return GetUtils.isEmail(value) ? null : 'validation_email'.tr;
  }

  setRating(double value) {
    rating = value;
  }

  void saveReview() {
    if (reviewFormKey.currentState!.validate()) {
      final review = Review(
        restaurant: slug,
        email: emailFormKey.value.text.trim(),
        comments: commentFormKey.value.text.trim(),
        rating: rating.toInt(),
      );
      reviewProvider.saveReview(review).then((result) {
        Get.back(result: "updated");
      }, onError: (err) {});
    }
  }

  @override
  void onClose() {
    emailFormKey.dispose();
    commentFormKey.dispose();
    super.onClose();
  }
}
