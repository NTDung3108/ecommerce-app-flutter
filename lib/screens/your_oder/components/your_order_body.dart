import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/order_details/order_details_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class YourOrderBody extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => ListView.builder(
        itemCount: productController.orders.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // margin: EdgeInsets.symmetric(
            //   horizontal: getProportionateScreenWidth(20),
            //   vertical: getProportionateScreenWidth(10),
            // ),
            elevation: 8,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mã đơn hàng: ${productController.orders[index].uidOrderBuy}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            Text(
                              productController.orders[index].datee!
                                  .substring(0, 10),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Text(
                          'TỔng giá: ${NumberFormat('###,###', 'en_US').format(productController.orders[index].amount)} VND',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              OrderDetailsScreen.routeName,
                              arguments: OrderDetailArguments(
                                  index: index),
                            );
                            productController.getOrderDetails('${productController
                                .orders[index].uidOrderBuy}');
                          },
                          child: const Text(
                            'Nhấn để xem chi tiết',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15),
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
    ));
  }


}
