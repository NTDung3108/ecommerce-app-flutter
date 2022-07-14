import 'dart:developer';

import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

enum PaymentMethods { vnpay, credit, directpayment }

class OrderForm extends StatefulWidget {
  @override
  _OrderForm createState() => _OrderForm();
}

class _OrderForm extends State<OrderForm> {
  PaymentMethods _payments = PaymentMethods.vnpay;

  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];

  String? address;
  String? note;

  static const String txtVNPay = 'VNPay';
  static const String txtCredit = 'Thẻ ngân hàng';
  static const String txtDP = 'Thanh toán khi nhận hàng';

  static String payment = 'VNPay';

  final UserController userController = Get.find();
  final ProductController productController = Get.find();

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
    // TODO: implement build
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            buildAddressFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            const Text('Phương thức thanh toán'),
            SizedBox(height: getProportionateScreenHeight(20)),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text(txtVNPay),
                  leading: Radio(
                    value: PaymentMethods.vnpay,
                    groupValue: _payments,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _payments = value!;
                        payment = txtVNPay;
                        log(payment);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(txtCredit),
                  leading: Radio(
                    value: PaymentMethods.credit,
                    groupValue: _payments,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _payments = value!;
                        payment = txtCredit;
                        log(payment);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(txtDP),
                  leading: Radio(
                    value: PaymentMethods.directpayment,
                    groupValue: _payments,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _payments = value!;
                        payment = 'COD';
                        log(payment);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildNoteFormField(),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
              text: "Tiếp tục",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if(address == ''){
                    address = userController.information.value.address;
                  }
                  bool isEnough = await productController.checkProducts(context);
                  if(isEnough)
                   productController.saveOrderBuyProduct(address!, note!, payment, context);
                  // Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      initialValue: userController.information.value.address,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: addressNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: addressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Địa chỉ",
        hintText: "Nhập địa chỉ giao hàng",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildNoteFormField() {
    return TextFormField(
      onSaved: (newValue) => note = newValue,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: "Ghi chú",
        hintText: "Ghi chú của bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}