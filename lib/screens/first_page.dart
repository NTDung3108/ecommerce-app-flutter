import 'dart:async';

import 'package:ecommerce_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'home/home_screen.dart';

class FirstPage extends StatefulWidget {
  static String routeName = "/first_page";

  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Timer? _timer;

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      checkPage();
    });
  }

  void checkPage() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var isFirst = await secureStorage.read(key: 'isFirst');
    if(isFirst != null){
      Navigator.pushNamed(context, HomeScreen.routeName);
    }else{
      Navigator.pushNamed(context, SplashScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
