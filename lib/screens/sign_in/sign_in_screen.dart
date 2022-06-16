import 'package:ecommerce_app/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    final SignInArguments agrs = ModalRoute.of(context)!.settings.arguments as SignInArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        leading: const SizedBox(),
      ),
      body: SingInBody(page: agrs.page,),
    );
  }
}

class SignInArguments {
  final String page;

  SignInArguments({required this.page});
}
