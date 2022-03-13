import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountBanner extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider(
          items: List.generate(
              homeController.discountsHome.length,
              (index) => Container(
                width: double.infinity,
                margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(15),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A3298),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text.rich(
                    TextSpan(
                        style: const TextStyle(color: Colors.white), children: [
                          TextSpan(
                              text: '${homeController.discountsHome[index].title}\n'),
                          TextSpan(
                              text: '${homeController.discountsHome[index].content}',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(24),
                                  fontWeight: FontWeight.bold)
                          )
                    ]
                    )
                ),
          )
          ),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            enlargeCenterPage: true,
            viewportFraction: 1,
            initialPage: 0,
            height: SizeConfig.screenHeight * 0.2
          )
      );
    }
  );
}}
