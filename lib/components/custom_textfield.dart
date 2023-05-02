import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isHidePassword;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.isHidePassword = false})
      : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: TextField(
          obscureText: widget.isHidePassword,
          controller: widget.controller,
          onTapOutside: (event) =>
              {FocusManager.instance.primaryFocus?.unfocus()},
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
