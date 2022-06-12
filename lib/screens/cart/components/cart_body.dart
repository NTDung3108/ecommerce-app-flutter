import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/cart/components/cart_card.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartBody extends StatefulWidget {
  @override
  _CartBody createState() => _CartBody();
}

class _CartBody extends State<CartBody> {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: productController.productCarts.isEmpty
              ? const Center(
                  child: Text('Cart is emty'),
                )
              : ListView.builder(
                  itemCount: productController.productCarts.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                        key: Key(
                            '${productController.productCarts[index].uidProduct}'),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            setState(() {
                              productController.deleteProductToCart(index);
                            });
                          }
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              const Spacer(),
                              SvgPicture.asset('assets/icons/Trash.svg'),
                            ],
                          ),
                        ),
                        child: CartCard(
                          cart: productController.productCarts[index],
                          index: index,
                        )),
                  ),
                ),
        ));
  }
}
