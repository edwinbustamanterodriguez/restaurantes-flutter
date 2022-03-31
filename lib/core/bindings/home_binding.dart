import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/home_controller.dart';
import 'package:restaurantes/core/providers/home_provider.dart';
class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeProvider());
    Get.lazyPut<HomeController>(() => HomeController(homeProvider: Get.find()));
  }
}