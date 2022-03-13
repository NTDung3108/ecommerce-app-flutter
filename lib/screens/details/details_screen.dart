import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/screens/details/components/custom_app_bar.dart';
import 'package:ecommerce_app/screens/details/components/details_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: 0.0),
      ),
      body: DetailsBody(products: agrs.products),
    );
  }
}

class ProductDetailsArguments {
  final Products products;

  ProductDetailsArguments({required this.products});
}
