import 'dart:developer';

import 'package:ecommerce_app/components/custom_surfix_icon.dart';
import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Gender { male, female, other }

class CompeleteProfileForm extends StatefulWidget {
  const CompeleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFrom createState() => _CompleteProfileFrom();
}

class _CompleteProfileFrom extends State<CompeleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  Gender? _gender = Gender.male;
  String sGender = 'nam';

  final UserController userController = Get.find();

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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: <Widget>[
              Radio<Gender>(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    sGender = 'nam';
                  });
                },
              ),
              Text('Nam'),
              Radio<Gender>(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    sGender = 'n???';
                  });
                },
              ),
              Text('N???'),
              Radio<Gender>(
                value: Gender.other,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    sGender = 'kh??c';
                  });
                },
              ),
              Text('Kh??c'),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Ti???p t???c",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('$firstName');
                log('$lastName');
                log('$address');
                userController.registerUserInfo(
                    firstName: firstName,
                    lastName: lastName,
                    address: address,
                    phone: FirebaseAuth.instance.currentUser?.phoneNumber!.replaceAll('+1', ''),
                    gender: sGender,
                    uid: FirebaseAuth.instance.currentUser?.uid,
                    context: context);
                // Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: addressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: addressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "?????a ch???",
        hintText: "?????a ch??? c???a b???n",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: const InputDecoration(
        labelText: "T??n",
        hintText: "Nh???p t??n c???a b???n",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: namelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: namelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "H???",
        hintText: "Nh???p h??? c???a b???n",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
