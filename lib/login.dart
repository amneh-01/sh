// File: login_screen.dart
import 'package:flutter/material.dart';
import 'package:shaglat/dg.dart';
import 'package:shaglat/knj.dart';
import 'package:shaglat/sigup.dart';
import 'package:shaglat/transm.dart';
// استيراد دالة السحب من اليمين


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // محتوى اللوحة الجانبية (الزر)
    final panelContentWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center, // توسيط عمودي للمحتوى في اللوحة
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
               // الانتقال إلى شاشة إنشاء حساب باستخدام ترانزيشن السحب من اليمين
              Navigator.of(context).pushReplacement(
                createSlideFromRightTransitionRoute(destinationPage: SignUpScreen()),
              );
            },
             style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700, // لون أزرق للزر
                foregroundColor: Colors.white, // لون النص
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            child: Text('إنشاء حساب', textAlign: TextAlign.center),
          ),
        ),
         SizedBox(height: 20),
         // يمكن إضافة عناصر أخرى في اللوحة الجانبية هنا
         Text('أو تسجيل الدخول', style: TextStyle(color: Colors.white70)),

      ],
    );

    // محتوى الشاشة الرئيسي (نموذج تسجيل الدخول أو نص)
    final mainContentWidget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'مرحباً بعودتك!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
           // هنا يمكنك إضافة حقول إدخال البريد وكلمة المرور وزر تسجيل الدخول الفعلي
           // مثال بسيط:
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30.0),
             child: TextField(
               decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
             ),
           ),
           SizedBox(height: 10),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30.0),
             child: TextField(
               obscureText: true,
               decoration: InputDecoration(labelText: 'كلمة المرور'),
             ),
           ),
           SizedBox(height: 20),
           ElevatedButton(onPressed: (){ /* TODO: Login Logic */ }, child: Text('تسجيل الدخول')),
           TextButton(onPressed: (){ /* TODO: Forgot Password */ }, child: Text('نسيت كلمة المرور؟')),

        ],
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'),
        centerTitle: true,
      ),
      body: SidePanelLayout(
        mainContent: mainContentWidget, // المحتوى الرئيسي هو نموذج تسجيل الدخول
        panelContent: panelContentWidget, // محتوى اللوحة هو الزر
        panelPosition: ClipSide.right, // اللوحة الجانبية على اليمين
        panelWidth: 150.0, // يمكنك تخصيص عرض اللوحة
        panelColor: Colors.blue.shade800, // لون اللوحة
        panelCurveRadius: 40.0, // نصف قطر الانحناء
      ),
    );
  }
}