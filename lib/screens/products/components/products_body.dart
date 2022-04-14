import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/products/components/products_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import 'filter_list.dart';
import 'item_product.dart';

class ProductsBody extends StatelessWidget{
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              ProductsHeader(),
              SizedBox(height: getProportionateScreenHeight(20)),
              FilterList(),
              SizedBox(height: getProportionateScreenHeight(20),),
              ItemProduct()
            ],
          ),
        )
    );
  }
}





