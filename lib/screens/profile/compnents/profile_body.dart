import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/screens/profile/compnents/profile_menu.dart';
import 'package:ecommerce_app/screens/profile/compnents/profile_pic.dart';
import 'package:ecommerce_app/screens/userInfo/user_info.dart';
import 'package:ecommerce_app/screens/your_oder/your_order_screen.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBody extends StatelessWidget {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: 'Tài khoản của tôi',
            icon: 'assets/icons/User Icon.svg',
            press: () async {
              var hasToken = await AuthServices().hasToken();
              if (hasToken) {
                Navigator.pushNamed(context, UserInfo.routeName);
              } else {
                const snackBar = SnackBar(
                    content: Text('You need to login to use this function'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
          ProfileMenu(
            text: 'Thông báo',
            icon: 'assets/icons/Bell.svg',
            press: () async {
              var hasToken = await AuthServices().hasToken();
              if (hasToken) {
              } else {
                const snackBar = SnackBar(
                    content: Text('You need to login to use this function'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
          ProfileMenu(
            text: 'Đơn hàng của tôi',
            icon: 'assets/icons/Cart Icon.svg',
            press: () async {
              var hasToken = await AuthServices().hasToken();
              if (hasToken) {
                Navigator.pushNamed(context, YourOrderScreen.routeName);
              } else {
                const snackBar = SnackBar(
                    content: Text('You need to login to use this function'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
          ProfileMenu(
            text: 'Cài đặt',
            icon: 'assets/icons/Settings.svg',
            press: () {},
          ),
          ProfileMenu(
            text: 'Chung tâm chăm sóc khách hàng',
            icon: 'assets/icons/Question mark.svg',
            press: () {},
          ),
          ProfileMenu(
            text: 'Đăng xuất',
            icon: 'assets/icons/Log out.svg',
            press: () async {
              var hasToken = await AuthServices().hasToken();
              if (hasToken) {
                authController.logout(context);
              } else {
                const snackBar = SnackBar(
                    content: Text('Bạn cần đăng nhập để sử dụng chức năng này'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          )
        ],
      ),
    );
  }
}
