import 'dart:developer';

import 'package:ecommerce_app/components/custom_surfix_icon.dart';
import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? password;
  String? conform_password;
  final List<String?> errors = [];

  final AuthController authController = AuthController.instance;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Tiếptucj",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                String? userId = FirebaseAuth.instance.currentUser?.uid;
                String? phone = FirebaseAuth.instance.currentUser?.phoneNumber;
                if(authController.forgotPass){
                  authController.forgotPassword(password: '$password', phone: phone!.replaceAll('+1', ''), context: context);
                  log('$phone+$password');
                  authController.forgotPass = false;
                }else{
                  authController.registerUser(phone!.replaceAll('+1', ''), '$password', '$userId', context);
                  log('$userId+$phone+$password');
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: matchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if ((password != value)) {
          addError(error: matchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Xác nhận mật khẩu",
        hintText: "Nhập Lại Mật Khẩu",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 8) {
          removeError(error: shortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: shortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mật khẩu",
        hintText: "Nhập Mật Khẩu Của Bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('conform_password', conform_password));
  }
}
