import 'package:ecommerce_app/screens/sign_up/components/sign_up_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng kí"),
      ),
      body: SignUpBody(),
    );
  }
}
