import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/phone_verification/components/phone_verification_form.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';

class PhoneVerificationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Text(
              "Xác thực số điện thoại của bạn",
              style: headingStyle,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            PhoneVerificationForm()
          ]),
        ),
      ),
    );
  }
}
