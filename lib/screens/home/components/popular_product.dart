import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/screens/home/components/section_title.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProducts extends StatelessWidget {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: 'Popular Product',
            press: () {},
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        SizedBox(
          height: getProportionateScreenHeight(250),
          child: Obx(() {
            if (homeController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.homeProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                      products: homeController.homeProducts[index]);
                });
          }),
        ),
        // SizedBox(
        //   width: getProportionateScreenWidth(20),
        // )
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       Obx(() {
        //         if (homeController.isLoading.value) {
        //           return const CircularProgressIndicator();
        //         }
        //         return ListView.builder(
        //             itemCount: homeController.homeProducts.length,
        //             itemBuilder: (context, index) {
        //               return ProductCard(
        //                   products: homeController.homeProducts[index]);
        //             });
        //       }),
        //       SizedBox(
        //         width: getProportionateScreenWidth(20),
        //       )
        //     ],
        //   ),
        // )
        // Expanded(
        //     child: CustomScrollView(
        //   scrollDirection: Axis.horizontal,
        //   slivers: [
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (context, index) => Obx(() {
        //           if (homeController.isLoading.value) {
        //             return const Center(
        //               child: CircularProgressIndicator(),
        //             );
        //           } else {
        //             return ProductCard(
        //                 products: homeController.homeProducts[index]);
        //           }
        //         }),
        //         childCount: homeController.homeProducts.length,
        //       ),
        //     ),
        //   ],
        // ))
      ],
    );
  }
}
