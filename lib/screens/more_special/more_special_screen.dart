import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../products/products_screen.dart';
import 'components/custom_more_special_appbar.dart';
import 'components/more_special_card.dart';

class MoreSpecialScreen extends StatelessWidget {
  static String routeName = "/morespecial";
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          leading: CustomMoreSpecialAppBar()),
      body: SafeArea(child: Container(
        child: Obx(() {
          return ListView.builder(
            itemCount: homeController.subcategoriesHome.length,
            itemBuilder: (context, index) => MoreSpecialCard(
                category: homeController.subcategoriesHome[index].name,
                image: homeController.subcategoriesHome[index].picture,
                press: () {
                  Navigator.pushNamed(
                      context,
                      ProductsScreen.routeName,
                      arguments: ProductsArguments(
                          subCategoryID: homeController.subcategoriesHome[index].id
                      )
                  );
                }),
          );
        }),
      )),
    );
  }
}

