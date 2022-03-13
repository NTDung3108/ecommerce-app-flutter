import 'package:ecommerce_app/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductsHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(5)),
            child: SizedBox(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        primary: primaryColor,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      "assets/icons/Back ICon.svg",
                      height: 20,
                    )
                )
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20),),
          SearchField(),
        ],
      ),
    );
  }
}