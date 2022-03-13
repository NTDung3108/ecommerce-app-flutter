import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/otp/components/otp_form.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';

class OTPBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Text(
                'OTP Verification',
                style: headingStyle,
              ),
              Text('We send your code to'),
              buildTimer(),
              OTPForm(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
