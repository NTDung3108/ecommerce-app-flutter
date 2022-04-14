import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/screens/userInfo/components/user_info_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  static String routeName = '/userinfo';

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Information',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: UserInfoBody(),
    );
  }
}
