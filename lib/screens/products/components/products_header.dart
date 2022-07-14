import 'dart:developer';

import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/subcategory/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductsHeader extends StatelessWidget{
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
                        padding: EdgeInsets.zero
                    ),
                    onPressed: () => Navigator.pushNamed(context, SubCategory.routeName),
                    child: SvgPicture.asset(
                      "assets/icons/Back ICon.svg",
                      height: 20,
                    )
                )
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20),),
          Container(
            width: SizeConfig.screenWidth * 0.6,
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (value) {
                log(value);
                if(productController.searchFill.value) {
                  productController.searching(value);
                } else {
                  productController.searchingProduct(value, productController.products);
                }

              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(9)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Tìm kiếm sản phẩm",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}