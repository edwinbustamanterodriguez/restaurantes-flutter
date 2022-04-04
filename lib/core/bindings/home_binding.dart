import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/home_controller.dart';
import 'package:restaurantes/core/providers/restaurant_provider.dart';
class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RestaurantProvider());
    Get.lazyPut<HomeController>(() => HomeController(restaurantProvider: Get.find(), ));
  }
}