import 'package:flutter/material.dart';
import 'package:shaglat/login.dart';
import 'package:shaglat/sigup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool? isFirstLaunch; // اجعلها قابلة للقيم الفارغة

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // تحقق مما إذا كانت القيمة موجودة بالفعل
    bool? storedIsFirstLaunch = prefs.getBool('isFirstLaunch');

    setState(() {
      isFirstLaunch = storedIsFirstLaunch ?? true; // استخدم القيمة المخزنة أو true كقيمة افتراضية
    });

    // انتظر قليلاً لعرض شاشة البداية
    await Future.delayed(Duration(seconds: 3));

    if (isFirstLaunch == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 120.5,
                backgroundImage: AssetImage("assets/images/logo.jpg"),
               
              ),
            ],
          ),
        ),
    
    );
  }
}