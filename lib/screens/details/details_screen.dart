import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/details/components/custom_app_bar.dart';
import 'package:ecommerce_app/screens/details/components/details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    final DetailPageArguments agrs =
        ModalRoute.of(context)!.settings.arguments as DetailPageArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          idProduct: productController.detail.value.idProduct!,
          page: agrs.page,
        ),
      ),
      body: DetailBody(),
    );
  }
}

//
class DetailPageArguments {
  final String page;

  DetailPageArguments({required this.page});
}
