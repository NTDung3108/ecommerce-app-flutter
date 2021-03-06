import 'package:ecommerce_app/controllers/subcategories_controller.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/product_controller.dart';
import '../../size_config.dart';

class SubCategory extends StatelessWidget{
  static String routeName = "/subcategory";
  final SubCategoriesController subCategoriesController = Get.put(SubCategoriesController());
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    // subCategoriesController.fetchCategories(args.categoryID!);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: CustomSubCategoryAppBar()
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Obx((){
          return GridView.builder(
              itemCount: subCategoriesController.subcategories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0
              ),
              itemBuilder: (context, index){
                return GestureDetector(
                  child: Card(
                      margin: const EdgeInsets.all(10),
                      color: const Color(0xFFFDDECB),
                      elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network('http://192.168.78.19:3000/${subCategoriesController.subcategories[index].icon}'),
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              '${subCategoriesController.subcategories[index].name}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                  ),
                  onTap: () {
                    productController.fetchProducts(subCategoriesController.subcategories[index].id);
                    productController.fetchBrands(subCategoriesController.subcategories[index].id);
                    Navigator.pushNamed(
                        context,
                        ProductsScreen.routeName
                    );
                  }
                );
              }
          );
        })
      )
    );
  }
}

class CustomSubCategoryAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              onPressed: () => Navigator.pushNamed(
                  context,
                  HomeScreen.routeName
              ),
              child: SvgPicture.asset(
                "assets/icons/Back ICon.svg",
                height: 20,
              )
          )
      ),
    );
  }
}