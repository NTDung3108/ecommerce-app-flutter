import 'dart:developer';
import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/screens/subcategory/sub_category.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(55),
        child: Obx(() {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeController.categoriesHome.length,
            itemBuilder: (context, index) {
              int? id = homeController.categoriesHome[index].id;
              log('$id');
              return CategoryCard(
                  text: homeController.categoriesHome[index].category,
                  press: (){
                    if(homeController.categoriesHome[index].id == -1){

                    }else{
                      Navigator.pushNamed(
                        context,
                        SubCategory.routeName,
                        arguments: SubCategoryArguments(categoryID: id));
                    }
                  }
              );
            },
          );
        }));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          padding: text!.length >10
            ?EdgeInsets.only(top: getProportionateScreenWidth(5))
            :EdgeInsets.only(top: getProportionateScreenWidth(12)),
          margin: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          height: getProportionateScreenHeight(55),
          width: getProportionateScreenWidth(80),
          decoration: BoxDecoration(
            color: const Color(0xFFFFECDF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(text!, textAlign: TextAlign.center),
        ));
  }
}
