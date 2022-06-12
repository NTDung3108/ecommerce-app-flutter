import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/product/product_card.dart';
import 'package:ecommerce_app/screens/details/components/product_desciption.dart';
import 'package:ecommerce_app/screens/details/components/product_images.dart';
import 'package:ecommerce_app/screens/details/components/top_rounded_container.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
class DetailBody extends StatefulWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  final ProductController productController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(detail: productController.detail.value),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                detail: productController.detail.value,
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'SL: ${productController.detail.value.quantily}',
                        style:
                        const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(2)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                NumberFormat('###,###', 'en_US')
                                    .format(productController.detail.value.price ?? 0) +
                                    ' VND',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(24),
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(40),
                              ),
                              child: DefaultButton(
                                text: 'Add To Cart',
                                press: () {
                                  var productCard = ProductCart(
                                      uidProduct: productController.detail.value.idProduct,
                                      image: productController.detail.value.picture![0],
                                      name: '${productController.detail.value.nameProduct}',
                                      quantity: 1,
                                      price: productController.detail.value.price!,
                                      importPrice: productController.detail.value.importPrice! * 1);
                                  productController.addProductToCart(
                                      productCard, context);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(10),
                              ),
                              child: const Text(
                                'Review',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                              ),
                              child: const Divider(),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: getProportionateScreenHeight(400),
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Container();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
