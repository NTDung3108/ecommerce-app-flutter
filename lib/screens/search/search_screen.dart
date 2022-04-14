import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/controllers/subcategories_controller.dart';
import 'package:ecommerce_app/screens/search/components/search_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget{
  static String routeName = "/searchscreen";

  ProductController productController = Get.find();
  SubCategoriesController subCategoriesController = Get.put(SubCategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBody(),
    );
  }
}