import 'package:ecommerce_app/screens/home/components/categories.dart';
import 'package:ecommerce_app/screens/home/components/discount_banner.dart';
import 'package:ecommerce_app/screens/home/components/home_header.dart';
import 'package:ecommerce_app/screens/home/components/special_offers_card.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';

import 'popular_product.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
