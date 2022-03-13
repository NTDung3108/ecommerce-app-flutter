import 'dart:ui';

import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  _OTPForm createState() => _OTPForm();
}

class _OTPForm extends State<OTPForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  TextEditingController pin0 = TextEditingController();
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextFiel(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  AuthController authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: pin0,
                  autofocus: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  onChanged: (value) {
                    nextFiel(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: pin1,
                  focusNode: pin2FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  onChanged: (value) {
                    nextFiel(value, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: pin2,
                  focusNode: pin3FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  onChanged: (value) {
                    nextFiel(value, pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: pin3,
                  focusNode: pin4FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  onChanged: (value) {
                    nextFiel(value, pin5FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: pin4,
                  focusNode: pin5FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  onChanged: (value) {
                    nextFiel(value, pin6FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: pin5,
                  focusNode: pin6FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  onChanged: (value) {
                    pin6FocusNode!.unfocus();
                  },
                ),
              )
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              String smsCode = pin0.text +
                  pin1.text +
                  pin2.text +
                  pin3.text +
                  pin4.text +
                  pin5.text;
              authController.otp(smsCode);
              //Navigator.pushNamed(context, SignUpScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
