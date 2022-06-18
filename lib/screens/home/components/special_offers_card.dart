import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/controllers/subcategories_controller.dart';
import 'package:ecommerce_app/screens/home/components/section_title.dart';
import 'package:ecommerce_app/screens/more_special/more_special_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../products/products_screen.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final ProductController _productController = Get.find();
  final SubCategoriesController _subCategoriesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: 'Special for you',
            press: () {
              Navigator.pushNamed(context, MoreSpecialScreen.routeName);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SizedBox(
          height: getProportionateScreenHeight(115),
          child: Obx(() {
            if (homeController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeController.subcategoriesHome.length,
              itemBuilder: (context, index) => SpecialOfferCard(
                  category: homeController.subcategoriesHome[index].name,
                  image: homeController.subcategoriesHome[index].picture,
                  press: () {
                    _productController.fetchProducts(_subCategoriesController.subcategories[index].id);
                    _productController.fetchBrands(_subCategoriesController.subcategories[index].id);
                    Navigator.pushNamed(
                        context,
                        ProductsScreen.routeName,
                    );
                  }),
            );
          }),
        )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard(
      {Key? key,
      required this.category,
      required this.image,
      required this.press})
      : super(key: key);

  final String? category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2.3,
                  child: Image.network(
                    'http://192.168.2.101:3000/$image',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15)
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(10)),
                  child: Text.rich(TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: '$category\n',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                            )),
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
