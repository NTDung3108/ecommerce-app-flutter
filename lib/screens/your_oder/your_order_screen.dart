import 'package:ecommerce_app/screens/your_oder/components/your_order_body.dart';
import 'package:flutter/material.dart';

class YourOrderScreen extends StatelessWidget {
  static String routeName = "/your_order";

  @override
  Widget build(BuildContext context) {
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
