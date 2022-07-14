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
const String phoneNullError = "Vui lòng nhập số điện thoại của bạn";
const String invalidPhoneError = "Xin nhập số điện thoại hợp lệ";
const String passNullError = "Vui lòng nhập nhập mật khẩu";
const String shortPassError = "Mật khẩu quá ngắn";
const String matchPassError = "Mật khẩu không khớp";
const String namelNullError = "Vui lòng nhập tên cảu bạn";
const String phoneNumberNullError = "Vui lòng nhập số điện thoại";
const String addressNullError = "Vui lòng nhập địa chỉ";

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
