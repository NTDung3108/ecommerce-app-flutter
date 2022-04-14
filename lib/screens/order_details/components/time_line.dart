import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/product/puchased_products_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class TimeLine extends StatelessWidget {
  TimeLine({Key? key, required this.index}) : super(key: key);

  final int index;

  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    var orderBuy = productController.orders[index];
    return Container(
      height: getProportionateScreenWidth(120),
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 50,
                width: 120,
                child: Row(
                  children: [
                    index > 0
                        ? Container(
                      height: 2,
                      width: 45,
                      color: orderBuy.status! < 1 && index == 2
                          ? Colors.grey
                          : primaryColor,
                    )
                        : const SizedBox(
                      width: 45,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            color: orderBuy.status! >= index
                                ? primaryColor
                                : Colors.grey),
                        child: orderBuy.status! >= index
                            ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                            : Text(
                          '${index + 1}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                    index < 2
                        ? Container(
                      height: 2,
                      width: 45,
                      color: orderBuy.status! >= index
                          ? primaryColor
                          : Colors.grey,
                    )
                        : SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title(index),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
  String title(int status) {
    if (status == 1) {
      return 'Order\nShipped';
    } else if (status == 2) {
      return 'Compelete';
    }
    return 'Order\nProcessed';
  }
}
