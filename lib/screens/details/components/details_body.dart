import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/screens/details/components/product_desciption.dart';
import 'package:ecommerce_app/screens/details/components/product_images.dart';
import 'package:ecommerce_app/screens/details/components/top_rounded_container.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import 'color_dots.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.products}) : super(key: key);

  final Products products;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(products: products),
        TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  products: products,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                    color: const Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'SL: ${products.quantily}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 24),
                            )
                          ],
                        ),
                        TopRoundedContainer(
                          color: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.15,
                                  right: SizeConfig.screenWidth * 0.15,
                                  bottom: getProportionateScreenWidth(40),
                                  top: getProportionateScreenWidth(2)),
                              child: Column(
                                children: [
                                  Text(
                                    NumberFormat('###,###', 'en_US')
                                            .format(products.price) +
                                        ' VND',
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(24),
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(15),),
                                  DefaultButton(
                                    text: 'Add To Cart',
                                    press: () {},
                                  )
                                ],
                              )),
                        )
                      ],
                    ))
              ],
            ))
      ],
    );
  }
}
