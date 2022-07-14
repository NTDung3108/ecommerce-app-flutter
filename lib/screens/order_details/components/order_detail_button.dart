import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/product/puchased_products_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/form_error.dart';
import '../../../size_config.dart';

class OrderDetailButton extends StatelessWidget {
  final ProductController productController = Get.find();

  final int index;

  OrderDetailButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: Colors.white,
              backgroundColor: Colors.lightGreenAccent.shade700),
          onPressed: () {
            productController.updateOrderStatus(
                status: 2,
                orderId: productController.orders[index].uidOrderBuy!,
                index: index,
                reason: ''
            );
          },
          child: Text(
            'Hoàn thành',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.white),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: Colors.white,
              backgroundColor: Colors.redAccent.shade700),
          onPressed: () {
            // productController.updateOrderStatus(
            //     status: -1,
            //     orderId: productController.orders[index].uidOrderBuy!,
            //     index: index);
            showDialog(
              context: context,
              builder: (BuildContext context) => ReasonDialog(index: index,),
            );
          },
          child: Text(
            'Hủy',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.white),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
      ],
    );
  }
}

class ReasonDialog extends StatefulWidget {
  final int index;

  const ReasonDialog({Key? key, required this.index}) : super(key: key);

  @override
  _ReasonDialog createState() => _ReasonDialog();
}

class _ReasonDialog extends State<ReasonDialog> {
  final _formKey = GlobalKey<FormState>();
  String? reason;

  final List<String?> errors = [];

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
    return AlertDialog(
      title: const Text('Lý do hủy'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              buildNoteFormField(),
              FormError(errors: errors),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.pop(context, 'Cancel'),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              productController.updateOrderStatus(
                  status: -1,
                  orderId: productController.orders[widget.index].uidOrderBuy!,
                  index: widget.index,
                reason: reason!
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Đồng ý'),
        )
      ],
    );
  }

  TextFormField buildNoteFormField() {
    return TextFormField(
      onSaved: (newValue) => reason = newValue,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'Lý do không được để trống');
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'Lý do không được để trống');
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Lý do",
        hintText: "Nhập lý do của bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
