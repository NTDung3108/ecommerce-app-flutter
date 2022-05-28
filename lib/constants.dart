import 'package:flutter/material.dart';

import 'size_config.dart';

const primaryColor = Color(0xFFFF7643);
const primaryLightColor = Color(0xFFFFECDF);
const primaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);
const animationDuration = Duration(milliseconds: 200);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
const String phoneNullError = "Please Enter your phone number";
const String invalidPhoneError = "Please Enter Valid phone number";
const String passNullError = "Please Enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String namelNullError = "Please Enter your name";
const String phoneNumberNullError = "Please Enter your phone number";
const String addressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: textColor),
  );
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
