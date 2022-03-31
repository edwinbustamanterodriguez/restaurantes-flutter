import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:restaurantes/config/app_constants.dart';
import 'package:restaurantes/core/models/restaurant.dart';

class HomeProvider extends GetConnect {

  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    httpClient.defaultDecoder = Restaurant.listFromJson;
    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = 'X-CSRFToken: ' + token;
      return request;
    });
  }

  Future<Response<List<Restaurant>>> getRestaurants() => get<List<Restaurant>>(baseUrl);
  Future<Response<Restaurant>> postRestaurant(body) => post<Restaurant>(baseUrl, body, decoder: (obj) => Restaurant.fromJson(obj));
}
