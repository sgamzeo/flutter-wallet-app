// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
 
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.white, // Varsayılan buton arka plan rengi
    this.textColor = Colors.white70, // Varsayılan buton metin rengi
    this.borderColor = Colors.black,
    this.borderWidth = 0.4

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          backgroundColor: backgroundColor, // Butonun arka plan rengi
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Butonun kenar yuvarlaklığı
              side: BorderSide(color: borderColor, width: borderWidth)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon), // Eğer ikon varsa ekle
              SizedBox(width: 8), // Araya boşluk ekle
            ],
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Buton metin rengi
              ),
            ),
          ],
        ),
      ),
    );
  }
}
