import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/pages/restaurant/home/card_food_type.dart';
import 'package:restaurantes/utils/themes/colors.dart';

class FoodTypes extends StatelessWidget {
  const FoodTypes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('food_types'.tr, style: kHeaderTitle),
          const SizedBox(height: 14),
          SizedBox(
              height: size.height / 9,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CardFoodType (title: "Hamburguesas"),
                  CardFoodType (title: "China"),
                  CardFoodType (title: "Japonesa"),
                  CardFoodType (title: "Oaxaqueña"),
                  CardFoodType (title: "Tacos"),
                ],)
          ),
        ],
      ),
    );
  }
}

