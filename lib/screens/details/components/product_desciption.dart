import 'package:ecommerce_app/controllers/favorite_controller.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/models/product/product_detail.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final Detail detail;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String? firstHalf;
  String? seconhalf;

  bool flag = true;

  final FavoritesController favoritesController = Get.find();

  @override
  void initState() {
    super.initState();

    int? length = widget.detail.description?.length;

    if (length! > 50) {
      firstHalf = widget.detail.description?.substring(0, 50);
      seconhalf = widget.detail.description?.substring(50, length);
    } else {
      firstHalf = widget.detail.description;
      seconhalf = '';
    }

    favoritesController.checkFavorite(widget.detail.idProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            '${widget.detail.nameProduct}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // SizedBox(
        //   height: getProportionateScreenHeight(20),
        // ),
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
          child: Row(
            children: [
              const Text(
                'Hãng sản xuất: ',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                '${widget.detail.brand}',
                style: const TextStyle(color: Colors.black),
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // favoritesController.addOrDeleteFavorites(widget.detail);
                    },
                    child: Obx(() => Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: getProportionateScreenWidth(64),
                      decoration: BoxDecoration(
                        color: favoritesController.favorite.value
                            ? const Color(0xFFFFE6E6)
                            : const Color(0xFFF5F6F9),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: favoritesController.favorite.value
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                        height: getProportionateScreenWidth(16),
                      ),
                    )),
                  )),
            ],
          ),
        ),
        // SizedBox(
        //   height: getProportionateScreenHeight(20),
        // ),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Màu sắc: ',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(22),
                  width: getProportionateScreenWidth(100),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.detail.colors!.length,
                    itemBuilder: (context, index) {
                      if (index == widget.detail.colors!.length - 1) {
                        return (Text(
                          widget.detail.colors![index],
                          style: const TextStyle(color: Colors.black),
                        ));
                      } else {
                        return (Text(
                          '${widget.detail.colors![index]}, ',
                          style: const TextStyle(color: Colors.black),
                        ));
                      }
                    },
                  ),
                )
              ],
            )),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: const Text('Desciption:'),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20),
          ),
          child: seconhalf!.isEmpty
              ? Text('$firstHalf')
              : Column(
                  children: [
                    Text(flag
                        ? (firstHalf! + ' ...')
                        : (firstHalf! + seconhalf!)),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text(flag ? 'show more' : 'show less')],
                      ),
                      onTap: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                    )
                  ],
                ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
      ],
    );
  }
}
