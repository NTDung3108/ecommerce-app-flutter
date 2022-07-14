import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class TagList extends StatefulWidget{
  _TagList createState() => _TagList();
}

class _TagList extends State<TagList>{
  final ProductController productController = Get.find();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productController.tags.value = [];
    productController.fillterList = [];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
      children: [
        const Text('Lọc: '),
        SizedBox(
          width: getProportionateScreenWidth(280),
          child: Obx(
                () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productController.tags.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    String tag = productController.tags[index];
                    productController.removeFillterBrand(tag);
                    productController.deleteTag(tag);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(productController.tags[index]),
                        const Icon(
                          Icons.close,
                          color: Color(0xFF2D2D2D),
                          size: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}