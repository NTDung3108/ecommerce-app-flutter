import 'package:ecommerce_app/components/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/screens/profile/compnents/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    userController.getUserInfo(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: const SizedBox(),
      ),
      body: ProfileBody(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
