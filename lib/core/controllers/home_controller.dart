import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/core/providers/restaurant_provider.dart';
import 'package:restaurantes/routes/app_routes.dart';

class HomeController extends GetxController with StateMixin<List<Restaurant>> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final RestaurantProvider restaurantProvider;
  bool isSwitched = false;

  HomeController({required this.restaurantProvider,}){
    fetchRestaurant();
  }

  Future<void> fetchRestaurant() async {
    restaurantProvider.getRestaurants().then((result) {
      List<Restaurant>? data = result.body;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void showDetailRestaurant(String slug) {
    Get.toNamed(Routes.DETAIL,arguments: slug);
  }

  void createRestaurants() {
    Get.toNamed(Routes.CREATE_RESTAURANT);
  }

  void updateTranslation(){
    isSwitched = !isSwitched;
    var localeEN = const Locale('en', 'US');
    var localeES = const Locale('es', 'ES');
    Get.updateLocale(isSwitched?localeEN:localeES);
    GetTimeAgo.setDefaultLocale(isSwitched?"en":"es");
    update();
  }
}
