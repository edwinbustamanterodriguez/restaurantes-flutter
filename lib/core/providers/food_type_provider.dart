import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:restaurantes/config/app_constants.dart';
import 'package:restaurantes/core/models/food_type.dart';

class FoodTypeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = token;
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  Future<Response<List<FoodType>>> getFoodTypes() => get<List<FoodType>>(baseUrlCustom+foodTypes,decoder: (obj) => FoodType.listFromJson(obj));

}
