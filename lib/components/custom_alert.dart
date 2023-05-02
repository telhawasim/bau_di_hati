import 'package:flutter/cupertino.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? message;

  const CustomAlertDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Error"),
      content: Text(message!),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDestructiveAction: true,
          child: const Text("OK"),
        ),
      ],
    );
  }
}
