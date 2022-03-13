import 'package:ecommerce_app/components/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/screens/profile/compnents/profile_body.dart';
import 'package:ecommerce_app/screens/splash/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ProfileBody(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
