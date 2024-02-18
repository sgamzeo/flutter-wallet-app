// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeInput extends StatelessWidget {
  final int length;
  final ValueSetter<String>? onCompleted;
  final void Function(String) onChanged;

  const VerificationCodeInput({
    Key? key,
    required this.length,
    required this.onChanged,
    this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: PinCodeTextField(
        appContext: context,
        length: length,
        onChanged: onChanged,
        onCompleted: onCompleted,
        textStyle: TextStyle(fontSize: 24, color: Colors.black),
        backgroundColor: Colors.transparent,
        enableActiveFill: false,
        pinTheme: PinTheme(
          
          inactiveColor: Colors.grey,
          activeColor: Colors.black,
          activeFillColor: Colors.white,
          selectedColor: Colors.black,
          selectedFillColor: Colors.blue,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,
          borderWidth: 1,    
              
        ),
     

      ),
    );
  }
}
