import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/core/controllers/detail_controller.dart';
import 'package:restaurantes/core/controllers/home_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("Detalle del restaurante")),
        body: const Center(
          child: Text("Detalle"),
        ),
      ),
    );
  }
}
