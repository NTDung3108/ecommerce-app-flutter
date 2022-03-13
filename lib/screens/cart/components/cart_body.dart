import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/screens/cart/components/cart_card.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartBody extends StatefulWidget {
  @override
  _CartBody createState() => _CartBody();
}

class _CartBody extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
              key: Key(''),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {});
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset('assets/icons/Trash.svg'),
                  ],
                ),
              ),
              child:
                  SizedBox() /*CartCard(
              cart: demoCarts[index],
            ),*/
              ),
        ),
      ),
    );
  }
}
