import 'package:get/get.dart';
import 'package:restaurantes/core/providers/review_provider.dart';
class ReviewController extends GetxController {
  String slug = Get.arguments;
  final ReviewProvider reviewProvider;

  ReviewController({required this.reviewProvider}){
    reviewProvider.saveReview().then((result) {

    });
  }

}
