import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/home_controller.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/pages/drawer/drawer.dart';
import 'package:restaurantes/pages/restaurant/home/card_restaurant.dart';
import 'package:restaurantes/pages/restaurant/home/food_types.dart';
import 'package:restaurantes/pages/restaurant/home/home_header.dart';
import 'package:restaurantes/utils/themes/colors.dart';
import 'package:restaurantes/utils/widgets/loading_custom.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        key: controller.key,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'app_name'.tr,
            style: kRestaurantTitle,
            textAlign: TextAlign.center,
          ),
          leading: GestureDetector(
              onTap: () {
                controller.key.currentState!.openDrawer();
              },
              child: Image.asset('assets/images/avatar.png', scale: 4)),
        ),
        drawer: const DrawerCustom(),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const HomeHeader(),
              const FoodTypes(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24, top: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('suggestion'.tr, style: kHeaderTitle),
                    const SizedBox(height: 14),
                    controller.obx(
                      (List<Restaurant>? data) => ListView.builder(
                        itemCount: data?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller
                                .showDetailRestaurant(data![index].slug ?? ''),
                            child: CardRestaurant(restaurant: data![index]),
                          );
                        },
                      ),
                      onLoading: const Center(child: LoadingCustom()),
                      onError: (error) => Center(
                        child: Text( 'error'.trParams({'error': error.toString(),}),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onEmpty: Text('no_restaurants'.tr),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => controller.createRestaurants(),
        ),
      ),
    );
  }
}
