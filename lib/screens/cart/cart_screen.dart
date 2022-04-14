import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/cart/components/cart_body.dart';
import 'package:ecommerce_app/screens/cart/components/check_out_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final ProductController productController = Get.find();
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartBody(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      title: Center(
        child: Column(
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(color: Colors.black),
            ),
            Obx(() => Text(
                  '${productController.productCarts.length} item',
                  style: Theme.of(context).textTheme.caption,
                ))
          ],
        ),
      ),
    );
  }
}
