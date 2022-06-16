import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class LoginDialog {
  static showLoginDialog(BuildContext context, String page) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'You are not logged in. Please be logged in to use this function',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, SignInScreen.routeName, arguments: SignInArguments(page: page)),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
