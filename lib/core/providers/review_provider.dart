import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:restaurantes/config/app_constants.dart';
import 'package:restaurantes/core/models/review.dart';

class ReviewProvider extends GetConnect {
  @override
  void onInit() {
     httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = token;
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  Future<Response<Review>> saveReview(Review review) {
    return post<Review>(baseUrlCustom + reviews, review.toJson(),
        decoder: (obj) => Review.fromJson(obj));
  }
}
