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

  Future<Response<Review>> saveReview() {
    var data = {
      "restaurant": "c6e60295-6e40-47e5-b7ec-2396d8a54de7",
      "email": "david@example.com",
      "comments": "medio feo la comida",
      "rating": "1"
    };
    return post<Review>(baseUrlCustom + reviews, data,
        decoder: (obj) => Review.fromJson(obj));
  }
}
