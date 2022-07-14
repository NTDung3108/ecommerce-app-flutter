import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/otp/components/otp_form.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class OTPBody extends StatelessWidget {
  AuthController authController = Get.find();
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
                'Xác thực mã OTP',
                style: headingStyle,
              ),
              Text('Chúng tôi gửi mã của bạn tới số điện thoại${authController.phone}'),
              buildTimer(),
              OTPForm(),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              GestureDetector(
                onTap: () {
                  authController.verifyPhone(authController.phone, context, false);
                  const snackBar = SnackBar(
                    content: Text('mã OTP đã được gửi'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text(
                  "Gửi lại mã OTP",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                    fontSize: 16
                  ),
                ),
              ),
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
        const Text("Mã OTP sẽ hết hạn sau  "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 00.0),
          duration: const Duration(seconds: 60),
          builder: (_, dynamic value, child) {
            if (value < 60) {
              return Text(
                value < 10 ? "00:0${value.toInt()}" : "00:${value.toInt()}",
                style: const TextStyle(color: primaryColor),
              );
            } else {
              return Text(
                value.toInt() - 60 < 10
                    ? "01:0${value.toInt() - 60}"
                    : "01:${value.toInt() - 60}",
                style: const TextStyle(color: primaryColor),
              );
            }
          },
        ),
      ],
    );
  }
}
