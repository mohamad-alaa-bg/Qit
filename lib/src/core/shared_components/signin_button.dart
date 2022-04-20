import 'package:flutter/material.dart';
import 'package:qit/src/core/resources/enum.dart';

class SignInButton extends StatelessWidget {
  final ButtonType buttonType;
  final VoidCallback? onPressed;
  const SignInButton({Key? key, required this.buttonType,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: buttonType == ButtonType.google
          ? Image.asset('assets/images/gmail.png')
          : buttonType == ButtonType.facebook
              ? Image.asset('assets/images/facebook.png')
              : Image.asset('assets/images/twitter.png'),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent)),
    );
  }
}
