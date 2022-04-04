import 'package:flutter/material.dart';
import 'package:restaurantes/utils/themes/colors.dart';

class CardFoodType extends StatelessWidget {
  final String title;

  const CardFoodType({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: size.height / 9,
      width: size.width / 2 - 60,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: kCategoryTitle),
        ],
      ),
    );
  }
}