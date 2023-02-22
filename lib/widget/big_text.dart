import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final double size =20;
  final String text;
  BigText({Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size),
    );
  }
}

