import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/complete_profile/components/complete_profile_form.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompleteProfileBody extends StatelessWidget {
  const CompleteProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                ),
                Text("Hoàn thành", style: headingStyle),
                const Text(
                  "Hoàn thành thông tin chi tiết của bạn hoặc tiếp tục \n với mạng xã hội",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                const CompeleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "Bằng cách tiếp tục xác nhận rằng bạn đồng ý \n với Điều khoản và Điều kiện của chúng tôi",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
