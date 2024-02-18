// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double dividerThickness;
  final Color dividerColor;
  final double textPadding;

  const TextDivider({
    Key? key,
    required this.text,
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.dividerThickness = 2,
    this.dividerColor = Colors.grey,
    this.textPadding = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: dividerThickness,
            color: dividerColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: textPadding),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: dividerThickness,
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: TextDivider(
          text: "OR",
          textStyle: TextStyle(
            color: Color.fromARGB(181, 208, 208, 208),
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
          dividerThickness: 3,
          dividerColor: Color.fromARGB(181, 208, 208, 208),
          textPadding: 10,
        ),
      ),
    ),
  ));
}
