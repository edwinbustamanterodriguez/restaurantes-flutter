import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/review_controller.dart';
import 'package:restaurantes/utils/themes/colors.dart';

class ReviewPage extends GetView<ReviewController> {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<ReviewController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'form_comment_to'.tr,
            style: kHeaderTitle,
            textAlign: TextAlign.center,
          ),
          // You can add title here
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: kAccentColor),
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.transparent,
          //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.reviewFormKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 45,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating)=> controller.setRating(rating)
                  ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          controller: controller.emailFormKey,
                          decoration:
                              InputDecoration(labelText: 'form_email'.tr),
                          validator: (value) =>
                              controller.validatorEmail(value!),
                        ),
                        TextFormField(
                          maxLines: 4,
                          controller: controller.commentFormKey,
                          decoration:InputDecoration(labelText: 'form_comment'.tr),
                          validator: (value) => controller.validator(value!),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kAccentColor, // background
                      onPrimary: kSecondaryColor,
                      minimumSize: const Size.fromHeight(50), // foreground
                    ),
                    onPressed: () {
                      controller.saveReview();
                    },
                    child: Text(
                      'form_comment_to'.tr,
                      style: kButtonText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
