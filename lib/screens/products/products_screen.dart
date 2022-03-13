import 'package:ecommerce_app/controllers/controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/products/components/products_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget{
  static String routeName = "/productsscreen";
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    final ProductsArguments agrs =
    ModalRoute.of(context)!.settings.arguments as ProductsArguments;

    productController.fetchProducts(agrs.subCategoryID);
    productController.fetchBrands(agrs.subCategoryID);
    return Scaffold(
      body: ProductsBody(),
    );
  }
}

class ProductsArguments {
  final int? subCategoryID;

  ProductsArguments({this.subCategoryID});
}