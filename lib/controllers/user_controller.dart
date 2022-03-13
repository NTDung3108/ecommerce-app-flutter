import 'dart:developer';
import 'package:ecommerce_app/models/person.dart';
import 'package:ecommerce_app/services/user_services.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  late Rx<Person> _person = Person().obs;

  Person get person => _person.value;

  set person(Person value) => _person.value = value;

  void getUserInfo() async {
    try {
      isLoading(true);

      _person.value = (await UserServices.getPersonInformation())!;
    } finally {
      isLoading(false);
    }
  }

  void registerUserInfo(
      {required String firstName,
      required String lastName,
      required String phone,
      required String address,
      required String reference}) async {
    var resp = await UserServices.registerUserInfo(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        reference: reference);

    if (resp.resp!) {
      log(resp.msj!);
    } else {
      log(resp.msj!);
    }
  }
}
