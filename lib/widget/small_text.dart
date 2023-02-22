import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final double size =16;
  final String text;
  SmallText({Key? key,
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

