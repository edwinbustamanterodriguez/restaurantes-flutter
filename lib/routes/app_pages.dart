import 'package:get/get.dart';
import 'package:restaurantes/core/bindings/detail_binding.dart';
import 'package:restaurantes/pages/detail_page.dart';
import 'package:restaurantes/pages/home/home_page.dart';
import 'package:restaurantes/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailPage(),
      transition: Transition.leftToRight,
      binding: DetailBinding(),
    )
  ];
}