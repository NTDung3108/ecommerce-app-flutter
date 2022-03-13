import 'package:ecommerce_app/screens/profile/compnents/profile_menu.dart';
import 'package:ecommerce_app/screens/profile/compnents/profile_pic.dart';
import 'package:flutter/cupertino.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: 'My Account',
            icon: 'assets/icons/User Icon.svg',
            press: () {},
          ),
          ProfileMenu(
            text: 'Notification',
            icon: 'assets/icons/Bell.svg',
            press: () {},
          ),
          ProfileMenu(
            text: 'Settings',
            icon: 'assets/icons/Settings.svg',
            press: () {},
          ),
          ProfileMenu(
            text: 'Help Center',
            icon: 'assets/icons/Question mark.svg',
            press: () {},
          ),
          ProfileMenu(
            text: 'Log Out',
            icon: 'assets/icons/Log out.svg',
            press: () {},
          )
        ],
      ),
    );
  }
}
