import 'package:bau_di_hati/constants/colors.dart';
import 'package:bau_di_hati/presentation/Splash%20Page/components/body.dart';
import 'package:bau_di_hati/utils/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
      backgroundColor: appColor,
    );
  }
}
