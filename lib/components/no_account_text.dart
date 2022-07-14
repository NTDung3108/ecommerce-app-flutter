import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/phone_verification/phone_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bạn chưa có tài khoản? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, PhoneVerification.routeName),
          child: Text(
            "Đăng ký",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16), color: primaryColor),
          ),
        ),
      ],
    );
  }
}
