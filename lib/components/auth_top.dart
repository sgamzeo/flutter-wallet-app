// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthPageInfo extends StatelessWidget {
  final String title;
  final String description;

  const AuthPageInfo({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          Row(
            children: [
              Text(
                title,
                textAlign: TextAlign.end,
                

                      
                style: TextStyle(
                  
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -2
                  
                  
                
                  
                ),
                
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
