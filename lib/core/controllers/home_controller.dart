import 'package:get/get.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/core/providers/home_provider.dart';
import 'package:restaurantes/routes/app_routes.dart';

class HomeController extends GetxController with StateMixin<List<Restaurant>> {
  final HomeProvider homeProvider;

  HomeController({required this.homeProvider}){
    fetchRestaurant();
  }

  Future<void> fetchRestaurant() async {
    homeProvider.getRestaurants().then((result) {
      List<Restaurant>? data = result.body;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  void showDetailRestaurant(Restaurant slug) {
    Get.toNamed(Routes.DETAIL,arguments: slug);
  }

  void createRestaurants() {
    Get.toNamed(Routes.DETAIL);
  }
}
