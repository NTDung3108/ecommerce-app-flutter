import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class ItemProduct extends StatefulWidget{
  String page;

  ItemProduct({Key? key, required this.page}) : super(key: key);

  _ItemProduct createState() => _ItemProduct();
}

class _ItemProduct extends State<ItemProduct>{
  final ProductController productController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productController.searchProduct.value = [];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: getProportionateScreenHeight(600),
      child: Obx((){
        if(productController.isloading.value){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          itemCount: productController.searchProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 30,
              mainAxisExtent: 250
          ),
          itemBuilder: (context, index){
            return ProductCard(products: productController.searchProduct[index], page: widget.page);
          },
        );
      }),
    );
  }
}