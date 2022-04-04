
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/models/food_type.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/core/providers/food_type_provider.dart';
import 'package:restaurantes/core/providers/restaurant_provider.dart';
import 'package:image_picker/image_picker.dart';

class CreateRestaurantController extends GetxController
    with StateMixin<List<FoodType>> {
  final RestaurantProvider restaurantProvider;
  final FoodTypeProvider foodTypeProvider;
  List<String> selectedListFoodType = [];
  final Rx<XFile?> image = Rx<XFile?>(null);
  final ImagePicker picker = ImagePicker();

  final createRestaurantFormKey = GlobalKey<FormState>();
  final nameFormKey = TextEditingController();
  final descriptionFormKey = TextEditingController();
  final foodTypeFormKey = TextEditingController();

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

  String? validator(String value) {
    if (value.isEmpty) {
      return 'validation_empty'.tr;
    }
    return null;
  }

  String? validatorLists(List<FoodType>? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return 'validation_empty'.tr;
  }

  Future<void> saveRestaurant() async {
    if (createRestaurantFormKey.currentState!.validate()) {
      Restaurant restaurant = Restaurant(
          name: nameFormKey.value.text.trim(),
          foodType: selectedListFoodType,
          description: descriptionFormKey.value.text.trim(),
          image: image.value);

      restaurantProvider.saveRestaurant(restaurant).then((result) {
        Get.back(result: "success");
      }, onError: (err) {});
    }
  }

  @override
  void onClose() {
    nameFormKey.dispose();
    descriptionFormKey.dispose();
    foodTypeFormKey.dispose();
    super.onClose();
  }

  getFromGallery() async {
    image.value = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
  }
}
