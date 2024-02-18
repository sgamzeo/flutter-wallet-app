// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


import 'package:flutter_wallet_app/views/login/login_auth_view.dart';
import 'package:flutter_wallet_app/views/login/login_password_view.dart';

class AppRoutes {
  static const String login = '/';
  static const String pin = '/pin';

  static final Map<String, WidgetBuilder> routes = {
    login: (context) => LoginAuthView(),
    pin: (context) => LoginPasswordView(),
    // Diğer rotalar buraya eklenebilir
  };
}
