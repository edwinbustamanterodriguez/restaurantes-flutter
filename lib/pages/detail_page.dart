import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/utils/themes/colors.dart';
import 'package:restaurantes/core/controllers/detail_controller.dart';
import 'package:restaurantes/core/controllers/home_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("Detalle del restaurante")),
        body:Container(
          height: size.height * 0.4,
          width: size.width,
          decoration: BoxDecoration(
            color: kBackgroundColor.withOpacity(0.4),
            backgroundBlendMode: BlendMode.multiply,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              SizedBox(
                width:size.width - 40,
                child: Text(
                  "TITULO",
                  style: kRestaurantTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: size.width - 40,
                child: Text(
                  'Descripcion',
                  style: kRestaurantSubtitle,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: kBoxColor.withOpacity(0.2),
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         /* SvgPicture.asset('assets/icons/star.svg'),*/
                          const SizedBox(width: 2),
                          Text("45", style: kRestaurantTags),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    color: kBoxColor.withOpacity(0.2),
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*SvgPicture.asset('assets/icons/time.svg'),*/
                          const SizedBox(width: 2),
                          Text("movie.runtime", style: kRestaurantTags),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    color: kBoxColor.withOpacity(0.2),
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Aventura, Ciencia Ficcion, Comedia', style: kRestaurantTags),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
