import 'dart:developer';

import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/controllers/subcategories_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchHeader extends StatelessWidget{
  final SubCategoriesController subCategoriesController = Get.find();
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(5)),
            child: SizedBox(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        primary: primaryColor,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero),
                    onPressed: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      "assets/icons/Back ICon.svg",
                      height: 20,
                    ))),
          ),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.6,
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (value) {
                log(value);
                subCategoriesController.searching(value);
                productController.searchingProduct(value, productController.allProducts);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(9)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product or category",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}