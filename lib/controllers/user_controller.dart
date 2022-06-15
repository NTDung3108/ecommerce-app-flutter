import 'dart:developer';
import 'dart:io';
import 'package:ecommerce_app/models/Information.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var information = Information().obs;

  File? image;
  RxString img = ''.obs;
  final picker = ImagePicker();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserInfo();
  }

  void getUserInfo() async {
    try {
      isLoading(true);
      var personRSP = await UserServices.getPersonInformation();
      if(personRSP != null){
        information.value = personRSP;
        information.refresh();
      }
    } finally {
      isLoading(false);
    }
  }

  void registerUserInfo(
      {required String? firstName,
      required String? lastName,
      required String? phone,
      required String? address,
      required String? gender,
      required String? uid,
      required BuildContext context}) async {
    var resp = await UserServices.registerUserInfo(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        gender: gender,
        uid: uid
    );

    if (resp.resp! == true) {
      log(resp.msj!);
      Navigator.pushNamed(context, SignInScreen.routeName);
    } else {
      log(resp.msj!);
    }
  }

  void updatePhoto({required String? image, required String? uid}) async {
    final secureStore = FlutterSecureStorage();

    final resp = await UserServices.updateImageProfile(image, uid);

    if(resp.resp!){
      await secureStore.write(key: 'image', value: resp.profile);
      log(resp.msj!);
    }else{
      log(resp.msj!);
    }
  }

  void getImage(String? uid) async {
     var pickedFile = await picker.pickImage(source: ImageSource.gallery);

     if(pickedFile != null){

       image = File(pickedFile.path);
       img.value = pickedFile.path;
       img.refresh();

       log(img.value);
       updatePhoto(image: img.value, uid: uid!);
     }
  }

  void getPhoto() async {
    var pickedFile = await picker.pickImage(source: ImageSource.camera);

    if(pickedFile != null){

      image = File(pickedFile.path);
      img.value = pickedFile.path;
      img.refresh();

      log(img.value);
    }
  }

  void updateFirstName(
      {required String? firstName, required BuildContext context}) async {

    var resp = await UserServices.updateFirstName(firstName);
    if (resp!.resp == true) {
      log(resp.msj!);
      information.value.firstName = firstName;
      information.refresh();
      Navigator.pop(context);
      log('${information.value.firstName}');
    } else {
      log(resp.msj!);
    }
  }

  void updateLastName(
      {required String? lastName, required BuildContext context}) async {

    var resp = await UserServices.updateLastName(lastName);
    if (resp!.resp == true) {
      log(resp.msj!);
      information.value.lastName = lastName;
      information.refresh();
      Navigator.pop(context, 'Cancel');
      log('${information.value.lastName}');
    } else {
      log(resp.msj!);
    }
  }

  void updatePhone(
      {required String? phone, required BuildContext context}) async {

    var resp = await UserServices.updatePhone(phone);
    if (resp!.resp == true) {
      log(resp.msj!);
      information.value.phone = phone;
      information.refresh();
      Navigator.pop(context, 'Cancel');
      log('${information.value.phone}');
    } else {
      log(resp.msj!);
    }
  }

  void updateAddress(
      {required String? address, required BuildContext context}) async {

    var resp = await UserServices.updateAddress(address);
    if (resp!.resp!) {
      log(resp.msj!);
      information.value.address = address;
      information.refresh();
      Navigator.pop(context, 'Cancel');
      log('${information.value.address}');
    } else {
      log(resp.msj!);
    }
  }

}
