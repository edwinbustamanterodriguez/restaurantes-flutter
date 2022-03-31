import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/home_controller.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/pages/home/card_restaurant.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("RESTAURANTES")),
        body: Container(
          child: controller.obx(
            (List<Restaurant>? data) => ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return CardRestaurant(restaurant: data![index]);
              },
            ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onError: (error) => Center(
              child: Text(
                'Error: $error',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
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
