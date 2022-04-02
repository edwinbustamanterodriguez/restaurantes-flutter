import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/create_restaurant_controller.dart';
import 'package:restaurantes/core/providers/food_type_provider.dart';

class CreateRestaurantBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreateRestaurantController>(() => CreateRestaurantController(restaurantProvider: Get.find(),foodTypeProvider:  Get.put(FoodTypeProvider())));
  }
}