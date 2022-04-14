import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/controllers/subcategories_controller.dart';
import 'package:ecommerce_app/screens/search/components/search_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import 'list_category.dart';
import 'list_product.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBody createState() => _SearchBody();
}

class _SearchBody extends State<SearchBody> {
  final SubCategoriesController subCategoriesController = Get.find();
  final ProductController productController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subCategoriesController.searchList();
    productController.searchProduct.value = productController.allProducts;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subCategoriesController.clearSearch();
    productController.searchProduct.value = [];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          SearchHeader(),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                const Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                ListCategory(),
                SizedBox(height: getProportionateScreenHeight(20)),
                const Text(
                  'Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                ListProduct(),
              ],
            ),
          )
        ],
      ),
    );
  }
}




