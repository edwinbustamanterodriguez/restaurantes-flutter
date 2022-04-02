import 'package:get/get.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/core/providers/restaurant_provider.dart';
import 'package:restaurantes/routes/app_routes.dart';

class HomeController extends GetxController with StateMixin<List<Restaurant>> {
  final RestaurantProvider restaurantProvider;

  HomeController({required this.restaurantProvider}){
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
}
