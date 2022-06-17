import 'package:ecommerce_app/controllers/favorite_controller.dart';
import 'package:ecommerce_app/screens/home/components/categories.dart';
import 'package:ecommerce_app/screens/home/components/discount_banner.dart';
import 'package:ecommerce_app/screens/home/components/home_header.dart';
import 'package:ecommerce_app/screens/home/components/special_offers_card.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'popular_product.dart';

class HomeBody extends StatelessWidget {
  final FavoritesController favoritesController = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    favoritesController.getFavoritesProduct(context, HomeScreen.routeName);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            DiscountBanner(),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(20),),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
