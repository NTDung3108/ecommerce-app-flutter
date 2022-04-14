import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/helper/keyboard.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneVerificationForm extends StatefulWidget {
  @override
  _PhoneVerificationForm createState() => _PhoneVerificationForm();
}

class _PhoneVerificationForm extends State<PhoneVerificationForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneEditController = TextEditingController();

  String? phone;
  final List<String?> errors = [];

  AuthController authController = AuthController.instance;

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
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(80),
                  child: CountryCodePicker(
                    initialSelection: "VN",
                    hideMainText: true,
                    enabled: false,
                  ),
                ),
                const Text("|"),
                SizedBox(
                  width: getProportionateScreenWidth(220),
                  child: buildPhoneNumberFormField(),
                )
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                log('+1${phoneEditController.text}');
                var checkPhone = await authController.checkPhone(phone!, context);
                if(checkPhone){
                  authController.verifyPhone(phone!, context, true);
                  authController.phone = phone!;
                }else{
                  addError(error: 'Phone number already in use');
                }
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: phoneEditController,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: phoneNumberNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: phoneNumberNullError);
          return "";
        }
        return null;
      },
      inputFormatters: [LengthLimitingTextInputFormatter(20)],
      decoration: const InputDecoration(
        hintText: "Enter your phone number",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
