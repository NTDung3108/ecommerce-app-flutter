import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class LoginDialog {
  static showLoginDialog(BuildContext context, String page) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'Bạn cần đăng nhập để sử dụng chức năng này',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, SignInScreen.routeName, arguments: SignInArguments(page: page)),
            child: const Text('Đồng ý'),
          ),
        ],
      ),
    );
  }
}
