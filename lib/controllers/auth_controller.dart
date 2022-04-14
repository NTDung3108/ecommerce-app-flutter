import 'dart:developer';

import 'package:ecommerce_app/models/auth_model.dart';
import 'package:ecommerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../services/user_services.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;

  String verificationId = '';

  var token = ''.obs;
  var isLoading = true.obs;

  var forgotPass = false;
  var phone = '';

  Rx<Users> user = Users().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    _firebaseUser = Rx<User?>(_auth.currentUser);

    _firebaseUser.bindStream(_auth.userChanges());
  }

  void verifyPhone(String phoneNumber, BuildContext context, bool b) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: '+1$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          if (userCredential.user != null) {
            Navigator.pushNamed(context, OTPScreen.routeName);
          } else {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          log(this.verificationId);
          const snackBar = SnackBar(
            content: Text('Otp code has been sent'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushNamed(context, OTPScreen.routeName);
          // if(b){
          //   Navigator.pushNamed(context, OTPScreen.routeName);
          // }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
          print(verificationId);
          print("Timout");
        },
        timeout: const Duration(seconds: 60));
  }

  void otp(String smsCode, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: smsCode);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    if (userCredential != null) {
      Navigator.pushNamed(context, SignUpScreen.routeName);
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  void registerUser(String phone, String password, String idUser,
      BuildContext context) async {
    try {
      final resp = await AuthServices.createUsers(
          phone: phone, password: password, idUser: idUser);
      if (resp.resp == true) {
        log('${resp.msj}');
        Navigator.pushNamed(context, CompleteProfileScreen.routeName);
      } else {
        log('${resp.msj}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> forgotPassword(
      {required String password,
      required String phone,
      required BuildContext context}) async {
    try {
      final resp =
          await UserServices.forgotPassword(password: password, phone: phone);
      if (resp!.resp!) {
        log(resp.msj!);
        Navigator.pushNamed(context, SignInScreen.routeName);
        var snackBar = SnackBar(
          content: Text(resp.msj!),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        log(resp.msj!);
        var snackBar = SnackBar(
          content: Text(resp.msj!),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      log(e.toString());
      var snackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<bool> login(
      String? phone, String? password, BuildContext context) async {
    final sercureStorage = FlutterSecureStorage();
    try {
      var resp = await AuthServices.login(phone: phone, password: password);
      if (resp.resp!) {
        log('${resp.msj}');
        user.value = resp.users!;
        token.value = resp.token!;

        await AuthServices().persistenToken(resp.token, resp.refreshToken);

        await sercureStorage.write(key: 'uid', value: resp.users?.id);
        await sercureStorage.write(key: 'phone', value: resp.users?.phone);
        await sercureStorage.write(key: 'image', value: resp.users?.image);
        return true;
      } else {
        log('${resp.msj}');
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  void checkAuthencation() async {
    final secureStorage = FlutterSecureStorage();
    // ignore: await_only_futures
    final hasToken = await AuthServices().hasToken;

    // ignore: unrelated_type_equality_checks
    if (hasToken == true) {
      final resp = await AuthServices().renewToken();

      if (resp.resp!) {
        user.value = resp.users!;
      } else {
        await secureStorage.deleteAll();
      }
    } else {
      await secureStorage.deleteAll();
    }
  }

  void logout(BuildContext context) async {
    try {
      final secureStore = FlutterSecureStorage();

      await secureStore.deleteAll();
    } finally {
      log('logout');
      const snackBar = SnackBar(
        content: Text('Log Out successful'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void changePhotoProfile(String image) async {
    try {
      final secureStorage = FlutterSecureStorage();

      var uidPerson = await AuthServices().uidPersonStorage();

      final resp = await AuthServices()
          .updateImageProfile(image: image, uidPerson: '$uidPerson');

      await secureStorage.write(key: 'profile', value: resp.profile);

      user.value.image = resp.profile;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> checkPhone(String phone, BuildContext context) async {
    var resp = await UserServices.checkPhoneNumber(phone);

    if (resp!.resp!) {
      log('${resp.msj}');
      return true;
    } else {
      log('${resp.msj}');
      return false;
    }
  }
}
