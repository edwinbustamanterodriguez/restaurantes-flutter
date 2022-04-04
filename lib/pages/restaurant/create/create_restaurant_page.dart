import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:restaurantes/core/controllers/create_restaurant_controller.dart';
import 'package:restaurantes/core/models/food_type.dart';
import 'package:restaurantes/utils/themes/colors.dart';
import 'package:restaurantes/utils/widgets/loading_custom.dart';

class CreateRestaurantPage extends GetView<CreateRestaurantController> {
  const CreateRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<CreateRestaurantController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'add_restaurant'.tr,
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
            key: controller.createRestaurantFormKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:()=> controller.getFromGallery(),
                        child: Stack(
                          children: [
                            Obx(
                              () => controller.image.value != null
                                  ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                    child: Image.file(
                                        File(controller.image.value!.path),
                                        width: size.width / 4,
                                        height: size.width / 4,
                                        fit: BoxFit.fitWidth,
                                      ),
                                  )
                                  : Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kSecondaryColor,
                                        ),
                                        borderRadius:  BorderRadius.circular(10),
                                      ),
                                      width: size.width / 4,
                                      height: size.width / 4,
                                    ),
                            ),
                            Positioned(
                              bottom: 4-.0,
                              right: 4.0,
                              child: Icon(
                                Icons.upload,
                                color: kSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: controller.nameFormKey,
                                decoration:  InputDecoration(labelText: 'form_name'.tr),
                                validator: (value)=> controller.validator(value!),
                              ),
                              TextFormField(
                                maxLines: 4,
                                controller: controller.descriptionFormKey,
                                decoration: InputDecoration(labelText: 'form_description'.tr),
                                validator: (value)=> controller.validator(value!),
                              ),
                              const SizedBox(height: 16.0,),
                              controller.obx(
                                (List<FoodType>? foodTypes) =>
                                    MultiSelectDialogField<FoodType>(
                                  items: foodTypes
                                          ?.map((FoodType foodType) =>
                                              MultiSelectItem(foodType, foodType.name))
                                          .toList() ??
                                      [],
                                  listType: MultiSelectListType.CHIP,
                                  cancelText: Text('form_cancel'.tr),
                                  confirmText:  Text('form_ok'.tr),
                                  title:  Text('food_types'.tr),
                                  validator: (value)=> controller.validatorLists(value),
                                  onConfirm: (List<FoodType> values) =>
                                      controller.selectedListFoodType =
                                          values.map((e) => e.slug).toList(),
                                ),
                                onLoading: const Center(child:LoadingCustom()),
                                onError: (error) => Text('error'.trParams({'error':error.toString()}),
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                onEmpty: Text('no_food_types'.tr),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28.0,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kAccentColor, // background
                      onPrimary: kSecondaryColor,
                      minimumSize: const Size.fromHeight(50),// foreground
                    ),
                    onPressed: () {
                      controller.saveRestaurant();
                    },
                    child: Text('add_restaurant'.tr, style: kButtonText,),
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
