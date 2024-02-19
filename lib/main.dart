// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/views/login/login_auth_view.dart';
import 'package:flutter_wallet_app/service/routes.dart'; // AppRoutes'ı doğru yoldan import ettiğinizden emin olun
import 'package:provider/provider.dart';
import 'package:flutter_wallet_app/service/auth_provider.dart'; // AuthProvider sınıfını doğru yoldan import ettiğinizden emin olun
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(), // AuthProvider'ı ChangeNotifierProvider ile sarmalayın
      child: MaterialApp(
        initialRoute: AppRoutes.startingpage, // İlk açılan ekranın yolu
        routes: AppRoutes.routes, // Rotaları kullanarak MaterialApp'a tanımlayın
      ),
    );
  }
}
