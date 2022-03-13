import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.products,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Products products;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String? firstHalf;
  String? seconhalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    int? length = widget.products.description?.length;

    if (length! > 50) {
      firstHalf = widget.products.description?.substring(0, 50);
      seconhalf = widget.products.description?.substring(50, length);
    } else {
      firstHalf = widget.products.description;
      seconhalf = '';
    }
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
            '${widget.products.nameProduct}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Hãng sản xuất: ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '${widget.products.brand}',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            )),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
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
                  width:  getProportionateScreenWidth(100),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.products.colors!.length,
                    itemBuilder:(context, index){
                      if(index == widget.products.colors!.length - 1){
                        return(Text(
                          widget.products.colors![index],
                          style: const TextStyle(color: Colors.black),
                        )
                        );
                      }else{
                        return(Text(
                            '${widget.products.colors![index]}, ',
                          style: const TextStyle(color: Colors.black),
                        )
                        );
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
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)
          ),
          child: const Text('Desciption:'),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
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
      ],
    );
  }
}
