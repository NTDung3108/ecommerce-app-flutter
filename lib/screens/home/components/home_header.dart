import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          Obx(
            () => IconBtnWithCounter(
              svgSrc: 'assets/icons/Cart Icon.svg',
              numOfitem: productController.productCarts.length,
              press: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
          IconBtnWithCounter(
              svgSrc: 'assets/icons/Bell.svg', numOfitem: 3, press: () {})
        ],
      ),
    );
  }
}
