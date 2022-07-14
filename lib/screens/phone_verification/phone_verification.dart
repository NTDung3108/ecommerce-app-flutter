import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/screens/phone_verification/components/phone_verification_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneVerification extends StatelessWidget {
  static String routeName = "/phone_verification";
  AuthController authController = AuthController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xác thực số điện thoại"),
      ),
      body: PhoneVerificationBody(),
    );
  }
}
