import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/controllers/rating_controller.dart';
import 'package:ecommerce_app/models/product/product_card.dart';
import 'package:ecommerce_app/models/rating/rating.dart';
import 'package:ecommerce_app/screens/details/components/product_desciption.dart';
import 'package:ecommerce_app/screens/details/components/product_images.dart';
import 'package:ecommerce_app/screens/details/components/top_rounded_container.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailBody extends StatefulWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  final ProductController productController = Get.find();
  final RatingController ratingController = Get.find();

  @override
  void initState() {
    super.initState();
    ratingController.getComment(productController.detail.value.idProduct!);
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
                                NumberFormat('###,###', 'en_US').format(
                                        productController.detail.value.price ??
                                            0) +
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
                                      uidProduct: productController
                                          .detail.value.idProduct,
                                      image: productController
                                          .detail.value.picture![0],
                                      name:
                                          '${productController.detail.value.nameProduct}',
                                      quantity: 1,
                                      price:
                                          productController.detail.value.price!,
                                      importPrice: productController
                                              .detail.value.importPrice! *
                                          1);
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
                            GetBuilder<RatingController>(
                              assignId: true,
                              builder: (logic) {
                                return Container(
                                  width: double.infinity,
                                  height: getProportionateScreenHeight(400),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(15),
                                      vertical: getProportionateScreenWidth(8)),
                                  color: Colors.grey.withOpacity(0.1),
                                  child: logic.comments.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: logic.comments.length,
                                          itemBuilder: (context, index) {
                                            return commentCard(
                                                logic.comments[index]);
                                          },
                                        )
                                      : const Center(
                                          child: Text('No Comment'),
                                        ),
                                );
                              },
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

  Widget commentCard(Rating rating) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                'http://192.168.78.19:3000/${rating.image}',
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${rating.firstName} ${rating.lastName}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text(
                              '${rating.rating}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        Text('${rating.date}'),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  Text(
                    '${rating.comment}',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
