
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'change_info_dialog.dart';

class UserInfoMenu extends StatelessWidget {
  UserInfoMenu({
    Key? key,
    required this.text,
    required this.title,
    required this.label}) : super(key: key);

  final String text, title, label;

  @override
  Widget build(BuildContext context) {

    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: primaryColor,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => ChangeInfoDialog(
              title: title,
              lable: label,
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
                child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            )),
            const Text('thay đổi')
          ],
        ),
      ),
    );
  }
}


