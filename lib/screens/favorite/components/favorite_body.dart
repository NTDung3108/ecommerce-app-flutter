import 'dart:developer';

import 'package:ecommerce_app/components/rounded_icon_btn.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/favorite_controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/details/details_screen.dart';
import 'package:ecommerce_app/screens/favorite/favorite_screen.dart';
import 'package:ecommerce_app/screens/products/products_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoriteBody extends StatefulWidget {
  @override
  _FavoriteBody createState() => _FavoriteBody();
}

class _FavoriteBody extends State<FavoriteBody> {
  final FavoritesController favoritesController = Get.find();
  final ProductController productController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favoritesController.getFavoritesProduct(context, FavoriteScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: GetBuilder<FavoritesController>(
        builder: (logic) {
          if (logic.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: logic.favoritesProduct.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  log('next to product');
                  productController.productDetail(
                      logic.favoritesProduct[index].idProduct!,
                      context,
                      FavoriteScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 88,
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F6F9),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.network(
                                'http://192.168.78.19:3000/${logic.favoritesProduct[index].picture![0]}'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: getProportionateScreenWidth(200),
                        height: getProportionateScreenHeight(120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(200),
                              child: Text(
                                '${logic.favoritesProduct[index].nameProduct}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                maxLines: 2,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                log('next to favorite');
                                logic.addOrDeleteFavorites(
                                    logic.favoritesProduct[index].idProduct!,
                                    context,
                                    FavoriteScreen.routeName);
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(8)),
                                height: getProportionateScreenWidth(35),
                                width: getProportionateScreenWidth(35),
                                decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.15),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                    'assets/icons/Heart Icon_2.svg',
                                    color: const Color(0xFFFF4848)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
