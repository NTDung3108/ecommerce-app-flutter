import 'dart:developer';

import 'package:get/get.dart';

class Controller extends GetxController{
  var check = <bool>[].obs;

  void checkList(int count){
    check.value = List.generate(count, (_) => false);
  }
}