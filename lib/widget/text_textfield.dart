import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextandTextField extends StatelessWidget {
  final String text;
  double size;
  TextandTextField({Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(text,
              style: TextStyle(
                  fontSize: size,
                  fontWeight: FontWeight.w500
              )),
          Container(
            margin: EdgeInsets.only(top: 5),
            child:const TextField(
              //controller: idController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}