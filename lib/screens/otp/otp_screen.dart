import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/screens/otp/components/otp_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  static String routeName = "/otp";
  AuthController authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác thực mã OTP'),
      ),
      body: OTPBody(),
    );
  }
}
