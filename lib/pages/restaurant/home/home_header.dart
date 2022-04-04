import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:restaurantes/utils/themes/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('welcome_guy'.trParams({'name': 'Alfredo',},),
                  style: kHeaderTitle,
              ),
              const SizedBox(height: 7),
              Text('welcome'.tr, style: kHeaderSubtitle),
            ],
          ),
        ],
      ),
    );
  }
}
