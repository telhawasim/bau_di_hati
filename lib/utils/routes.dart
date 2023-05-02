import 'package:bau_di_hati/presentation/Login%20Page/login_page.dart';
import 'package:flutter/material.dart';
import '../presentation/Home Page/home_page.dart';
import '../presentation/Splash Page/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomePage.routeName: (context) => const HomePage(),
  LoginPage.routeName: (context) => const LoginPage(),
};
