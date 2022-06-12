import 'package:ecommerce_app/components/rounded_icon_btn.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/product/product_card.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  CartCard({Key? key, required this.cart, required this.index}) : super(key: key);

  final ProductCart cart;
  final int index;
  
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network('http://192.168.2.101:3000/${cart.image}'),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.name!.substring(0, 20) + '...',
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${cart.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: primaryColor),
                ),
                RoundedIconBtn(
                  icon: Icons.add,
                  press: () {
                    productController.plusQuatityProduct(index);
                  },
                  showShadow: true,
                ),
                Text('${cart.quantity}',
                    style: Theme.of(context).textTheme.bodyText1),
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {
                    productController.suntractQuantityProduct(index);
                  },
                  showShadow: true,
                ),
              ],
            ),
            // Text.rich(TextSpan(
            //     text: '\$${cart.price}',
            //     style: const TextStyle(
            //         fontWeight: FontWeight.w600, color: primaryColor),
            //     children: [
            //       TextSpan(
            //           text: 'x${cart.amount}',
            //           style: Theme.of(context).textTheme.bodyText1)
            //     ]))
          ],
        ))
      ],
    );
  }
}
