import 'package:ecommerce_app/screens/cart/components/cart_body.dart';
import 'package:ecommerce_app/screens/cart/components/check_out_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartBody(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'item',
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
