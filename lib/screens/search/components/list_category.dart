import 'package:ecommerce_app/controllers/subcategories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class ListCategory extends StatelessWidget {
  final SubCategoriesController subCategoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: getProportionateScreenHeight(210),
      margin: EdgeInsets.only(
        left: getProportionateScreenWidth(10),
      ),
      child: Obx(
            () => ListView.builder(
          itemCount: subCategoriesController.search.length,
          itemBuilder: (context, index) => Row(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(50),
                width: getProportionateScreenWidth(50),
                child: Image.network(
                  'http://192.168.30.105:3000/${subCategoriesController.search[index].icon}',
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              ),
              Text(
                '${subCategoriesController.search[index].name}',
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