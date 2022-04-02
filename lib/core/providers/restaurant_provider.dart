import 'package:dio/dio.dart' as d;
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:restaurantes/config/app_constants.dart';
import 'package:restaurantes/core/models/restaurant.dart';

class RestaurantProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier((Request request) {
      request.headers['X-CSRFToken'] =  token;
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  Future<Response<Restaurant>> getRestaurant(String slug)=> get<Restaurant>('$baseUrlCustom$restaurants/$slug', decoder: (obj) => Restaurant.fromJson(obj));

  Future<Response<List<Restaurant>>> getRestaurants() => get<List<Restaurant>>(baseUrlCustom+restaurants,decoder: (obj) => Restaurant.listFromJson(obj));

  /*Future<Response<Restaurant>> saveRestaurant(Restaurant restaurant) async{
    final form = FormData({
      'logo': restaurant.image !=null? MultipartFile(await restaurant.image?.readAsBytes(), filename: restaurant.image!.name):null,
      'name': restaurant.name,
      'description':restaurant. description,
      'food_type': restaurant.foodType,
    });
    return post<Restaurant>(baseUrlCustom+restaurants, form,decoder: (obj) => Restaurant.fromJson(obj),contentType: "multipart/form-data");
  }*/
  Future<Restaurant> saveRestaurant(Restaurant restaurant) async{
    var formData = d.FormData.fromMap({
      'name': restaurant.name,
      'description':restaurant. description,
      'food_type': restaurant.foodType,
      'logo':restaurant.image !=null? await d.MultipartFile.fromFile(restaurant.image!.path,filename: restaurant.image!.name):null
    });
    final response = await d.Dio().post(baseUrlCustom+restaurants, data: formData);
    return Restaurant.fromJson(response.data);
  }
}
