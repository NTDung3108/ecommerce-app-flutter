import 'dart:developer';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/screens/products/components/tag_list.dart';
import 'brands_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'price_range.dart';

class FilterList extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    log('${productController.brands.length}');
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productController.filters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    switch (productController.filters[index]) {
                      case 'Hãng':
                        log('Hãng');
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Hãng sản xuất'),
                                  content: BrandsDialog(),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                ));
                        break;
                      case 'Hàng mới':
                        log('Hàng mới');
                        productController.tags.remove('Bán chạy');
                        productController.tags.remove('Giá ↓');
                        productController.tags.remove('Giá ↑');
                        productController.addTag('Hàng mới');
                        productController.fillterNewProduct();
                        break;
                      case 'Bán chạy':
                        log('Bán chạy');
                        productController.tags.remove('Hàng mới');
                        productController.tags.remove('Giá ↓');
                        productController.tags.remove('Giá ↑');
                        productController.addTag('Bán chạy');
                        productController.fillterSale();
                        break;
                      case 'Khoảng giá':
                        log('Khoảng giá');
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Khoảng giá'),
                                  content: PriceRange(),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                ));
                        break;
                      case 'Giá ↑':
                        log('Giá ↑');
                        productController.filters[4] = 'Giá ↓';
                        productController.tags.remove('Giá ↑');
                        productController.tags.remove('Hàng mới');
                        productController.tags.remove('Bán chạy');
                        productController.tags.add('Giá ↓');
                        productController.fillterPrice('Giá ↓');
                        break;
                      case 'Giá ↓':
                        log('Giá ↓');
                        productController.filters[4] = 'Giá ↑';
                        productController.tags.remove('Giá ↓');
                        productController.tags.remove('Hàng mới');
                        productController.tags.remove('Bán chạy');
                        productController.tags.add('Giá ↑');
                        productController.fillterPrice('Giá ↑');
                        break;
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenWidth(8)),
                    margin:
                        EdgeInsets.only(right: getProportionateScreenWidth(10)),
                    height: getProportionateScreenHeight(55),
                    width: getProportionateScreenWidth(80),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(productController.filters[index],
                        textAlign: TextAlign.center),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
            child: TagList(),
          )
        ],
      ),
    );
  }
}
