import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class BrandsDialog extends StatefulWidget {
  @override
  _BrandsDialog createState() => _BrandsDialog();
}

class _BrandsDialog extends State<BrandsDialog> {
  final ProductController productController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // final Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * .7,
      height: SizeConfig.screenHeight * .35,
      child: Obx(() {
        return GridView.builder(
            itemCount: productController.brands.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                shadowColor: Colors.grey,
                child: Stack(
                  children: [
                    Center(
                      child: Image.network(
                        'http://10.50.10.90:3000/${productController.brands[index].picture}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Obx(
                          () => Checkbox(
                            value: productController.brands[index].isChecked,
                            shape: const CircleBorder(),
                            onChanged: (newValue) => setState(() {
                              var brand = productController.brands[index];
                              brand.isChecked = newValue!;
                              if (brand.isChecked!) {
                                productController.addTag('${brand.brand}');
                                productController.fillterBrand(brand.brandsId);
                              } else {
                                productController.removeFillterBrand(brand.brand);
                                productController.deleteTag('${brand.brand}');
                              }
                            }),
                          ),
                        )),
                  ],
                ),
              );
            });
      }),
    );
  }
}
