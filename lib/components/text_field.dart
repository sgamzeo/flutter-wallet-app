// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class VerificationCodeTextInput extends StatelessWidget {
  final int length;
  final ValueSetter<String>? onCompleted;
  final void Function(String) onChanged;

  const VerificationCodeTextInput({
    Key? key,
    required this.length,
    required this.onChanged,
    this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        keyboardType: TextInputType.datetime,
        maxLength: length,
        onChanged: onChanged,
        onSubmitted: onCompleted,
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          counterText: "", // No counter text
          filled: true,
          fillColor: Colors.white,
          hintText: 'e-Posta adresiniz',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
