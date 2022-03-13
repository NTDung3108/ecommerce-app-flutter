import 'dart:developer';

import 'package:ecommerce_app/models/auth_model.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;

  String verificationId = '';

  var token = ''.obs;
  var isLoading = true.obs;

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

  void verifyPhone(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          if (userCredential.user != null) {
            Get.to(OTPScreen());
          } else {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationId = this.verificationId;
          Get.to(OTPScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        },
        timeout: const Duration(seconds: 60));
  }

  void otp(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: smsCode);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    if (userCredential != null) {
      Get.to(SignUpScreen());
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  void registerUser(String phone, String password, String idUser) async {
    try {
      final resp = await AuthServices.createUsers(
          phone: phone, password: password, idUser: idUser);
      if (resp.resp!) {
        log('${resp.msj}');
      } else {
        log('${resp.msj}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void login(String phone, String password) async {
    final sercureStorage = FlutterSecureStorage();
    try {
      var resp = await AuthServices.login(phone: phone, password: password);
      if (resp.resp!) {
        log('${resp.msj}');
        user.value = resp.users!;
        token.value = resp.token!;

        await AuthServices().persistenToken(resp.token);
        await sercureStorage.write(
            key: 'uid', value: resp.users?.id.toString());
        await sercureStorage.write(key: 'phone', value: resp.users?.phone);
        await sercureStorage.write(key: 'image', value: resp.users?.image);
      } else {}
    } catch (e) {
      log(e.toString());
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

  void logout() async {
    final secureStore = FlutterSecureStorage();

    await secureStore.deleteAll();
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
}
