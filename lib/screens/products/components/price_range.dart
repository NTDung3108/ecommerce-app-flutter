import 'dart:developer';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/price_range_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class PriceRange extends StatefulWidget {
  @override
  _PriceRange createState() => _PriceRange();
}

class _PriceRange extends State<PriceRange> {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: SizeConfig.screenHeight * .21,
      width: SizeConfig.screenWidth * .7,
      child: GridView.builder(
        itemCount: priceRange.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            mainAxisExtent: 50),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (int i = 0; i < priceRange.length; i++) {
                  if (i == index) {
                    if (priceRange[i].isChecked) {
                      log('${priceRange[i].isChecked}');
                      priceRange[i].isChecked = false;
                      productController.deleteTag(priceRange[i].range);
                      // productController.tags.remove(priceRange[i].range);
                      log('${priceRange[i].isChecked}');
                    } else {
                      productController.deleteTag(productController.lastRange);
                      productController.addTag(priceRange[i].range);
                      productController.fillterRange(priceRange[i].range);
                      productController.lastRange = priceRange[i].range;
                      priceRange[i].isChecked = true;
                    }
                  } else {
                    priceRange[i].isChecked = false;
                  }
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: priceRange[index].isChecked
                      ? const Color(0xFFFFECDF)
                      : const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: priceRange[index].isChecked
                        ? const Color(0xFFFF7E2B)
                        : const Color(0xFFEEEEEE),
                  )),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check,
                      color: priceRange[index].isChecked
                          ? const Color(0xFFFF7E2B)
                          : const Color(0xFFEEEEEE),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(priceRange[index].range),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
