import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/models/food_type.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/core/providers/food_type_provider.dart';
import 'package:restaurantes/core/providers/restaurant_provider.dart';
import 'package:image_picker/image_picker.dart';

class CreateRestaurantController extends GetxController  with StateMixin<List<FoodType>> {
  final RestaurantProvider restaurantProvider;
  final FoodTypeProvider foodTypeProvider;
  List<String> selectedListFoodType = [];
  final Rx<XFile?> image = Rx<XFile?>(null);
  final ImagePicker picker = ImagePicker();

  final createRestaurantFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final foodTypeController = TextEditingController();

  CreateRestaurantController(
      {required this.restaurantProvider, required this.foodTypeProvider}) {
    getFoodTypes();
  }

  Future<void> getFoodTypes() async {
    foodTypeProvider.getFoodTypes().then((result) {
      List<FoodType>? data = result.body;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

   Future<void> saveRestaurant() async {

     Restaurant restaurant =  Restaurant(name: nameController.value.text.trim(),
                                         foodType: selectedListFoodType,
                                         description: descriptionController.value.text.trim(),
                                         image: image.value);

    restaurantProvider.saveRestaurant(restaurant).then((result) {
        printInfo(info: "RESTAURANT SAVED${result.slug}");
    }, onError: (err) {

    });
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    foodTypeController.dispose();
    super.onClose();
  }

  getFromGallery() async {
     image.value = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800,);
  }

}
