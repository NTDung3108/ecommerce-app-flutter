import 'package:ecommerce_app/controllers/controller.dart';
import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class BrandsDialog extends StatefulWidget{
  @override
  _BrandsDialog createState() => _BrandsDialog();
}

class _BrandsDialog extends State<BrandsDialog>{
  final ProductController productController = Get.find();
  // final Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * .7,
      height: SizeConfig.screenHeight * .35,
      child: Obx((){
        return GridView.builder(
            itemCount: productController.brands.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (context, index){
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
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Obx(() => Checkbox(
                    //     value: controller.check[index],
                    //     shape: const CircleBorder(),
                    //     onChanged: (newValue) => setState((){
                    //       controller.check[index] = newValue!;
                    //       if(controller.check[index]){
                    //         productController.addTag('${productController.brands[index].brand}');
                    //       }else{
                    //         productController.deleteTag('${productController.brands[index].brand}');
                    //       }
                    //     }
                    //     ),
                    //   ),
                    //   )
                    // ),
                  ],
                ),
              );
            }
        );
      }),
    );
  }
}