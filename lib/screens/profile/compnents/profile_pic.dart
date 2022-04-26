import 'dart:ui';

import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePic extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Obx(() {
            if (userController.information.value.image != null) {
              return CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://192.168.20.106:3000/${userController.information.value.image}'),
              );
            }
            return const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              backgroundColor: Colors.white,
            );
          }),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () => changeProfile(context),
                child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }

  changeProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      enableDrag: false,
      builder: (context) {
        return Container(
          height: 190,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                child: Text('Change profile picture',
                    style: GoogleFonts.getFont('Roboto',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 50,
                width: SizeConfig.screenWidth,
                child: Card(
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      userController
                          .getImage(userController.information.value.uid);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Select an image',
                          style: GoogleFonts.getFont('Roboto',
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: SizeConfig.screenWidth,
                child: Card(
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      userController.getPhoto();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Take a picture',
                          style: GoogleFonts.getFont('Roboto',
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
