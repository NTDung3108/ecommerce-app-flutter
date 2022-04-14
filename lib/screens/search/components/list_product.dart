import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class ListProduct extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: getProportionateScreenHeight(400),
      margin: EdgeInsets.only(
        left: getProportionateScreenWidth(10),
      ),
      child: Obx(
            () => ListView.builder(
          itemCount: productController.searchProduct.length,
          itemBuilder: (context, index) => Row(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(50),
                width: getProportionateScreenWidth(50),
                child: Image.network(
                  'http://10.50.10.90:3000/${productController.searchProduct[index].picture![0]}',
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              ),
              Text(
                productController.searchProduct[index].nameProduct!.length < 30
                    ? '${productController.searchProduct[index].nameProduct}'
                    : '${productController.searchProduct[index].nameProduct!.substring(0, 40)}...',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}