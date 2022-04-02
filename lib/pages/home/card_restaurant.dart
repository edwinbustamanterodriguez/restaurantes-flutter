import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:restaurantes/core/models/restaurant.dart';
import 'package:restaurantes/utils/themes/colors.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurant({required this.restaurant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0,bottom: 16.0),
      elevation: 1.0,
      shadowColor: kPrimaryColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),),
      child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: restaurant.logo??'',
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Positioned(
                  right: 8.0,
                  bottom: 8.0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: const BorderRadius.all(Radius.circular(4.0),)
                    ),
                    child:  Center(child: Text('${restaurant.rating}',  style: kRestaurantRating,textAlign: TextAlign.center,)),),
                ),
              ],
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: kRestaurantTitle,
                    textAlign: TextAlign.left,
                  ),
                  Row(children: [
                    Expanded(
                      child: Text(
                        restaurant.description,
                        style: kRestaurantSubtitle,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      '${restaurant.reviews?.length} Reseñas',
                      style: kRestaurantSubtitle,
                      textAlign: TextAlign.left,
                    ),
                  ],)
                ],
              ),
            ),
          ],
        ),
    );
  }
}
