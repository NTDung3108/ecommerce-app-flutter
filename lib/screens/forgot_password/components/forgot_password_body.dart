import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
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
              "Xác thực số điện thoại",
              style: headingStyle,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            ForgotPasswordForm()
          ]),
        ),
      ),
    );
  }
}