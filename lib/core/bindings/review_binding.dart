import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/review_controller.dart';
import 'package:restaurantes/core/providers/review_provider.dart';

class ReviewBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController(reviewProvider: Get.put(ReviewProvider())));
  }
}