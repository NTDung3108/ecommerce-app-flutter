import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/order_details/components/time_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'order_detail_button.dart';

class OrderDetailBody extends StatefulWidget{
  const OrderDetailBody({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _OrderDetailBody createState() => _OrderDetailBody();
}

class _OrderDetailBody extends State<OrderDetailBody> {
  final ProductController productController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.isStatus.value = productController.orders[widget.index].status!;
  }

  @override
  Widget build(BuildContext context) {
    var orderBuy = productController.orders[widget.index];
    return SafeArea(
        child: Obx(
      () => ListView(
        children: [
          productController.isStatus.value == -1
              ? const Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : TimeLine(index: widget.index),
          SizedBox(
            height: getProportionateScreenHeight(500),
            child: ListView.builder(
              itemCount: productController.orderDetails.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(10),
                    horizontal: getProportionateScreenWidth(10),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 8,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: getProportionateScreenWidth(120),
                        width: getProportionateScreenWidth(120),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: Image.network(
                            'http://10.50.10.90:3000/${productController.orderDetails[index].picture![0]}'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${productController.orderDetails[index].nameProduct}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'x${productController.orderDetails[index].quantity}',
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  NumberFormat('###,###', 'en_US').format(
                                          productController
                                              .orderDetails[index].price) +
                                      ' VND',
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(17),
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          productController.isStatus.value == -1 || productController.isStatus.value == 2
              ? const SizedBox()
              :OrderDetailButton(index: widget.index),
        ],
      ),
    ));
  }
}
