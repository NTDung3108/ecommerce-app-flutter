import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/screens/details/details_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.products, this.page,
  }) : super(key: key);

  final double width, aspectRetio;
  final Products products;
  final ProductController _productController = Get.find();
  final String? page;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: InkWell(
          onTap: () {
            _productController.productDetail(products.idProduct!,context,page!);
          } ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Hero(
                        tag: products.idProduct.toString(),
                        child: Image.network(
                            'http://192.168.2.101:3000/${products.picture![0]}')),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${products.nameProduct}',
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Text(
                NumberFormat('###,###','en_US').format(products.price)+' VND',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(17),
                    fontWeight: FontWeight.w600,
                    color: primaryColor),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //       borderRadius: BorderRadius.circular(50),
              //       onTap: () {},
              //       child: Container(
              //         padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              //         height: getProportionateScreenWidth(28),
              //         width: getProportionateScreenWidth(28),
              //         decoration: BoxDecoration(
              //             color: products.isFavourite
              //                 ? primaryColor.withOpacity(0.15)
              //                 : secondaryColor.withOpacity(0.1),
              //             shape: BoxShape.circle),
              //         child: SvgPicture.asset('assets/icons/Heart Icon_2.svg',
              //             color: product.isFavourite
              //                 ? const Color(0xFFFF4848)
              //                 : const Color(0xFFDBDEE4)),
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
