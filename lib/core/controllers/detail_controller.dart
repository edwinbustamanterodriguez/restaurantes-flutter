import 'package:get/get.dart';
import 'package:restaurantes/core/models/restaurant.dart';

class DetailController extends GetxController {
  Restaurant restaurant = Get.arguments;

  @override
  void onInit() {
    update();
    super.onInit();
  }
}
