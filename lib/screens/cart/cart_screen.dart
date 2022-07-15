import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/cart/components/cart_body.dart';
import 'package:ecommerce_app/screens/cart/components/check_out_card.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
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
              'Giỏ hàng của bạn',
              style: TextStyle(color: Colors.black),
            ),
            Obx(
              () => Text(
                '${productController.productCarts.length} sản phẩm',
                style: Theme.of(context).textTheme.caption,
              ),
            )
          ],
        ),
      ),
      leading: InkWell(
        onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
        child: ClipOval(
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
