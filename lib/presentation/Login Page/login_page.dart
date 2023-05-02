import 'package:bau_di_hati/components/custom_alert.dart';
import 'package:bau_di_hati/components/default_button.dart';
import 'package:bau_di_hati/constants/colors.dart';
import 'package:bau_di_hati/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login_page";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool textFieldValidation() {
    String? errorMessage;
    if (_emailController.text.isEmpty) {
      errorMessage = "Email address cannot be empty.";
    } else if (!_emailController.text.isValidEmail()) {
      errorMessage = "Email address must be a valid email.";
    } else if (_passwordController.text.isEmpty) {
      errorMessage = "Password cannot be empty.";
    } else if (_passwordController.text.length <= 5) {
      errorMessage = "Password must be greater than 5 digits";
    }
    if (errorMessage != null) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomAlertDialog(message: errorMessage),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60.0, right: 0),
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 30.0,
                  onPressed: () => {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Email or Phone Number",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                      hintText: "Enter email or phone number",
                      controller: _emailController)),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Password",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                      isHidePassword: true,
                      hintText: "Enter password",
                      controller: _passwordController)),
              const SizedBox(
                height: 28,
              ),
              DefaultButton(
                text: "Continue",
                fontSize: 16.0,
                backgroundColor: appColor,
                press: () {
                  textFieldValidation();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "By continuing, you agree to Bau di Hati’s ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.5)),
                      TextSpan(
                          text: "Conditions of Use ",
                          style: TextStyle(
                              color: blue39C0F0,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.5)),
                      TextSpan(
                          text: "and ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.5)),
                      TextSpan(
                          text: "Privacy Notice.",
                          style: TextStyle(
                              color: blue39C0F0,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.5)),
                    ])),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: const [
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    endIndent: 10,
                  )),
                  Text(
                    "New to Bau di Hati",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 10,
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: DefaultButton(
                  backgroundColor: green06DCB5,
                  text: "Create your Account",
                  press: () {},
                ),
              )
            ],
          ),
        ));
  }
}
