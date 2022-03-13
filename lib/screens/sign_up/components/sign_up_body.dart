import 'package:ecommerce_app/components/socal_card.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';

import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
              Text("Register Account", style: headingStyle),
              const Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocalCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocalCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocalCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
