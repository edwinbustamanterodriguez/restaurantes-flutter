import 'package:get/get.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/core/providers/restaurant_provider.dart';
import 'package:restaurantes/routes/app_routes.dart';

class DetailController extends GetxController  with StateMixin<Restaurant> {
  String slug = Get.arguments;
  final RestaurantProvider restaurantProvider;

  DetailController({required this.restaurantProvider}){
    getRestaurant(slug);

  }


  Future<void> getRestaurant(String slug) async {
    restaurantProvider.getRestaurant(slug).then((result) {
      Restaurant? data = result.body;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void review(String slug) {
     Get.toNamed(Routes.REVIEW,arguments: slug);
  }


}
