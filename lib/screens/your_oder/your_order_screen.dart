import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/your_oder/components/your_order_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourOrderScreen extends StatelessWidget {
  static String routeName = "/your_order";
  ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    productController.getOrderBuy(context, routeName);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Your Oder',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: YourOrderBody(),
    );
  }
}
