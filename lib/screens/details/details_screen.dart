import 'package:ecommerce_app/screens/details/components/custom_app_bar.dart';
import 'package:ecommerce_app/screens/details/components/details_body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final DetailPageArguments agrs =
        ModalRoute.of(context)!.settings.arguments as DetailPageArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: 0.0, page: agrs.page,),
      ),
      body: const DetailBody(),
    );
  }
}
//
class DetailPageArguments {
  final String page;

  DetailPageArguments({required this.page});
}
