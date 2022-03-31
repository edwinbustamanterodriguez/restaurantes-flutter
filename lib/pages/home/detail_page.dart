import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/models/review.dart';
import 'package:restaurantes/pages/home/card_comment.dart';
import 'package:restaurantes/core/controllers/detail_controller.dart';
import 'package:restaurantes/utils/themes/colors.dart';
class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<DetailController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("Detalle del restaurante")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: controller.restaurant.logo,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.4),
                        backgroundBlendMode: BlendMode.multiply,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.restaurant.name,
                                  style: kRestaurantTitleDetail,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  controller.restaurant.description,
                                  style: kRestaurantSubtitleDetail,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Califica y comenta",
                      style: kHeaderTitle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Comparte tu opinion con los demas usuarios",
                      style: kRestaurantSubtitle,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 48,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            "Calificaciones y opiniones",
                            style: kHeaderTitle,
                            textAlign: TextAlign.left,
                          ),
                          RatingBarIndicator(
                            rating: controller.restaurant.rating,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 40.0,
                            direction: Axis.horizontal,
                          ),
                        ],),
                      ) ,
                        const SizedBox(height: 24.0,),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: kAccentColor,
                            borderRadius: const BorderRadius.all(Radius.circular(4.0),)
                        ),
                        child:  Center(child: Text('${controller.restaurant.rating}',  style: kRestaurantRating,textAlign: TextAlign.center,)),),
                    ],),
                    ...controller.restaurant.reviews.map((Review review) => CardComment(review:review )).toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
