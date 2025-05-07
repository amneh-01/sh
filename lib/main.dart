// File: main.dart
import 'package:flutter/material.dart';
import 'package:shaglat/Splash.dart';
import 'package:shaglat/login.dart';
// ابدأ بشاشة تسجيل الدخول

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Signup with Directional Slide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(), // ابدأ من شاشة تسجيل الدخول
      debugShowCheckedModeBanner: false, // لإخفاء شارة "Debug"
    );
  }
}