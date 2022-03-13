import 'package:ecommerce_app/models/subcategory/saubcategories.dart';
import 'package:ecommerce_app/screens/favorite/favorite_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/phone_verification/phone_verification.dart';
import 'package:ecommerce_app/screens/products/products_screen.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/screens/subcategory/sub_category.dart';
import 'package:flutter/cupertino.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  PhoneVerification.routeName: (context) => PhoneVerification(),
  OTPScreen.routeName: (context) => OTPScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  SubCategory.routeName: (context) => SubCategory(),
  ProductsScreen.routeName: (context) => ProductsScreen(),
};
