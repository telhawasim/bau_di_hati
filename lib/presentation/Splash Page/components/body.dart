import 'package:bau_di_hati/constants/colors.dart';
import 'package:bau_di_hati/presentation/Login%20Page/login_page.dart';
import 'package:bau_di_hati/utils/size_config.dart';
import 'package:flutter/material.dart';

// This is the best practice
import '../../../components/default_button.dart';
import '../../../constants/string_constands.dart';
import 'splash_page_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Bau Di Hati, Let’s shop!",
      "image": "assets/images/dummy_logo.jpeg"
    },
    {
      "text": "We help people conect with store \naround Pakistan",
      "image": "assets/images/dummy_logo.jpeg"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/dummy_logo.jpeg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      backgroundColor: green06DCB5,
                      press: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      fontSize: 18.0,
                    ),
                    const Spacer(),
                    const Text(
                      "Powered By Synavos",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? green06DCB5 : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
