import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/screens/userInfo/components/user_info_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoBody extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        if (userController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(children: [
            UserInfoMenu(
              text: '${userController.information.value.firstName}',
              title: 'Update First Name',
              label: 'first name',
            ),
            UserInfoMenu(
              text: '${userController.information.value.lastName}',
              title: 'Update Last Name',
              label: 'last name',
            ),
            UserInfoMenu(
              text: '${userController.information.value.phone}',
              title: 'Update phone number',
              label: 'phone number',
            ),
            UserInfoMenu(
              text: '${userController.information.value.address}',
              title: 'Update address',
              label: 'address',
            ),
          ]),
        );
      }
    );
  }
}
