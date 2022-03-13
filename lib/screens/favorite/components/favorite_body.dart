import 'package:ecommerce_app/components/rounded_icon_btn.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteBody extends StatefulWidget {
  @override
  _FavoriteBody createState() => _FavoriteBody();
}

class _FavoriteBody extends State<FavoriteBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(""),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.15),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset('assets/icons/Heart Icon_2.svg',
                            color: const Color(0xFFFF4848)),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
