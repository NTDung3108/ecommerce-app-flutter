import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/order_details/components/order_detail_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  static String routeName = "/order detail";
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    final OrderDetailArguments agrs =
        ModalRoute.of(context)!.settings.arguments as OrderDetailArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Chi Tiết Đơn Hàng',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: OrderDetailBody(index: agrs.index,),
    );
  }
}

class OrderDetailArguments {
  final int index;

  OrderDetailArguments({required this.index});
}
