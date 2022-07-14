import 'package:flutter/material.dart';

import 'components/oder_body.dart';

class OderScreen extends StatelessWidget {
  static String routeName = "/order";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Đơn hàng',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: OderBody(),
    );
  }
}
