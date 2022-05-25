import 'package:ecommerce_app/components/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/controllers/favorite_controller.dart';
import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/screens/home/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  final HomeController homeController = Get.put(HomeController());
  final ProductController productController = Get.put(ProductController());
  final FavoritesController favoritesController = Get.put(FavoritesController());
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
