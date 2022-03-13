import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/phone_verification/phone_verification.dart';
// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
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
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => _processLogin(),
          //Navigator.pushNamed(context, PhoneVerification.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16), color: primaryColor),
          ),
        ),
      ],
    );
  }

  void _processLogin() async {
    var user = FirebaseAuth.FirebaseAuth.instance.currentUser;
    if (user == null) {}
  }
}
