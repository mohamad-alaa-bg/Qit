import 'package:flutter/material.dart';

class VerticalSizedBox extends StatelessWidget {
  final double height;
  const VerticalSizedBox({Key? key,required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}

class HorizontalSizedBox extends StatelessWidget {
  final double width;
  const HorizontalSizedBox({Key? key,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}
