import 'package:ecommerce_app/components/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/controllers/favorite_controller.dart';
import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/screens/favorite/components/favorite_body.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = '/favorite';
  FavoritesController favoritesController = FavoritesController();
  @override
  Widget build(BuildContext context) {
    favoritesController.getFavoritesProduct(context, routeName);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FavoriteBody(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.favorite),
    );
  }
}
