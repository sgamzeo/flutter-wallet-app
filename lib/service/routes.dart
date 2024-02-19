// ignore_for_file: prefer_const_constructors, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/models/wallet_account_model.dart';

import 'package:flutter_wallet_app/views/login/login_auth_view.dart';
import 'package:flutter_wallet_app/views/login/login_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/views/signup/signup_auth_view.dart';
import 'package:flutter_wallet_app/views/signup/signup_verificationcode_view.dart';
import 'package:flutter_wallet_app/views/signup/signup_verificationdetails_screen.dart';
import 'package:flutter_wallet_app/views/starting_view.dart';
import 'package:flutter_wallet_app/views/wallet_view.dart';

class AppRoutes {
  static const String startingpage = '/';
  static const String login = '/login';
  static const String pin = '/pin';
  static const String signup = '/signup';
  static const String wallet = '/wallet';
  static const String signupcode = '/signupcode';
  static const String signupdetails = '/signupdetails';

  static final Map<String, WidgetBuilder> routes = {
    startingpage: (context) => StartingView(),
    login: (context) => LoginView(),
    pin: (context) => LoginPasswordView(email:''),
    
    signup: (context) => SignUpView(title: '', description: '',),


    wallet: (context) => WalletView(
          
        ),
    signupcode: (context) => VerificationCodeView(email: ''),
    signupdetails: (context) =>
        VerificationDetailsView(email: '', verificationCode: ''),

    // Diğer rotalar buraya eklenebilir
  };
}
