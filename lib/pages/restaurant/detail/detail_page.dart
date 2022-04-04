import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/core/models/review.dart';
import 'package:restaurantes/core/controllers/detail_controller.dart';
import 'package:restaurantes/pages/restaurant/detail/card_comment.dart';
import 'package:restaurantes/utils/themes/colors.dart';
import 'package:restaurantes/utils/widgets/loading_custom.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<DetailController>(
      builder: (controller) => Scaffold(
        body: controller.obx(
          (Restaurant? restaurant) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: size.width,
                      child: CachedNetworkImage(
                        imageUrl: restaurant?.logo ?? '',
                        fit: BoxFit.fitWidth,
                        placeholder: (context, url) =>
                            const Center(child: LoadingCustom()),
                      ),
                    ),
                    Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: AppBar(// You can add title here
                          leading: IconButton(
                            icon:  Icon(Icons.arrow_back_ios, color: kAccentColor),
                            onPressed: () => Get.back(),
                          ),
                          backgroundColor: Colors.transparent, //You can make this transparent
                          elevation: 0.0, //No shadow
                        ),),
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
                                    restaurant!.name,
                                    style: kRestaurantTitleDetail,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    restaurant.description,
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
                        "rate_and_comment".tr,
                        style: kHeaderTitle,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                       "rate_description".tr,
                        style: kRestaurantSubtitle,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.review(restaurant.slug!);
                        },
                        child: Text(
                          "write_a_comment".tr,
                          style: kRestaurantSubtitleAccent,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ratings_and_opinions".tr,
                                  style: kHeaderTitle,
                                  textAlign: TextAlign.left,
                                ),
                                RatingBarIndicator(
                                  rating: restaurant.rating ?? 0.0,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 40.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: kAccentColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0),
                                )),
                            child: Center(
                                child: Text(
                              '${restaurant.rating?.toStringAsFixed(1)}',
                              style: kRestaurantRating,
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ],
                      ),
                      ...restaurant.reviews!
                          .map((Review review) => CardComment(review: review))
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onLoading: const Center(child: LoadingCustom()),
          onError: (error) => Center(
            child: Text('error'.trParams({'error':error.toString()}),
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          onEmpty: Text('no_restaurants'.tr),
        ),
      ),
    );
  }
}
