import 'package:flutter/material.dart';

import '../../../size_config.dart';

class MoreSpecialCard extends StatelessWidget {
  const MoreSpecialCard(
      {Key? key,
        required this.category,
        required this.image,
        required this.press})
      : super(key: key);

  final String? category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 3.4,
                  child: Image.network(
                    'http://192.168.78.19:3000/$image',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF343434).withOpacity(0.4),
                            const Color(0xFF343434).withOpacity(0.15)
                          ])),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(10)),
                  child: Text.rich(TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: '$category\n',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                            )),
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}