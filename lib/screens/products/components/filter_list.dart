import 'dart:developer';

import 'package:ecommerce_app/controllers/controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/sign_up/components/brands_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class FilterList extends StatelessWidget{

  var filters = ['Hãng','Hàng mới','Bán chạy','Khoảng giá','Giá'];

  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    log('${productController.brands.length}');
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)
      ),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    switch(filters[index]){
                      case 'Hãng':
                        log('Hãng');
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Hãng sản xuất'),
                              content: BrandsDialog(),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            )
                        );
                        break;
                      case 'Hàng mới':
                        log('Hàng mới');
                        productController.addTag('Hàng mới');
                        break;
                      case 'Bán chạy':
                        log('Bán chạy');
                        break;
                      case 'Khoảng giá':
                        log('Hãng');
                        break;
                      case 'Giá':
                        log('Giá');
                        break;
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: getProportionateScreenWidth(8)),
                    margin: EdgeInsets.only(left: getProportionateScreenWidth(10)),
                    height: getProportionateScreenHeight(55),
                    width: getProportionateScreenWidth(80),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(filters[index], textAlign: TextAlign.center),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          SizedBox(
            height: getProportionateScreenHeight(40),
            child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productController.tags.length,
              itemBuilder: (context, index){
                return Text(productController.tags[index]+'   ');
              },
            ),
            )
          )
        ],
      ),
    );
  }
}
