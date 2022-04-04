import 'package:get/get.dart';
import 'package:restaurantes/core/bindings/create_restaurant_binding.dart';
import 'package:restaurantes/core/bindings/detail_binding.dart';
import 'package:restaurantes/core/bindings/review_binding.dart';
import 'package:restaurantes/pages/restaurant/create/create_restaurant_page.dart';
import 'package:restaurantes/pages/restaurant/home/home_page.dart';
import 'package:restaurantes/pages/restaurant/detail/detail_page.dart';
import 'package:restaurantes/pages/restaurant/review/review_page.dart';
import 'package:restaurantes/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => const DetailPage(),
      transition: Transition.leftToRight,
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.CREATE_RESTAURANT,
      page: () => const CreateRestaurantPage(),
      transition: Transition.downToUp,
      binding: CreateRestaurantBinding(),
    ),
    GetPage(
      name: Routes.REVIEW,
      page: () => const ReviewPage(),
      transition: Transition.fadeIn,
      binding: ReviewBinding(),
    )
  ];
}