import 'dart:developer';

import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ChangeInfoDialog extends StatefulWidget {
  ChangeInfoDialog({Key? key, required this.title, required this.lable})
      : super(key: key);

  @override
  _ChangeInfoDialog createState() => _ChangeInfoDialog();
  String title, lable;
}

class _ChangeInfoDialog extends State<ChangeInfoDialog> {
  String? value;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];

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
    // TODO: implement build
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        height: SizeConfig.screenHeight * .2,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20),),
              TextFormField(
                keyboardType: widget.lable == 'phone number' ? TextInputType.phone : TextInputType.text,
                onSaved: (newValue) => value = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if(widget.lable == 'phone number'){
                      removeError(error: 'Please Enter your phone');
                    }else if(widget.lable == 'address'){
                      removeError(error: addressNullError );
                    } else {
                      removeError(error: namelNullError);
                  }
                  }
                  return null;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    if(widget.lable == 'phone number'){
                      addError(error: 'Please Enter your phone');
                    }else if(widget.lable == 'address'){
                      addError(error: addressNullError );
                    } else {
                      addError(error: namelNullError);
                    }
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: widget.lable,
                  hintText: "Enter your ${widget.lable}",
                  // If  you are using latest version of flutter then lable text and hint text shown like this
                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              FormError(errors: errors),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              log('$value');
              switch(widget.lable){
                case 'first name':
                  userController.updateFirstName(firstName: value,context: context);
                  break;
                case 'last name':
                  userController.updateLastName(lastName: value,context: context);
                  break;
                case 'phone number':
                  userController.updatePhone(phone: value,context: context);
                  break;
                case 'address':
                  userController.updateAddress(address: value,context: context);
                  break;
              }
            }
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}