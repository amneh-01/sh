// File: signup_screen.dart
import 'package:flutter/material.dart';
import 'package:shaglat/dg.dart';
import 'package:shaglat/knj.dart';
import 'package:shaglat/login.dart';
import 'package:shaglat/transm.dart';
// استيراد دالة السحب من اليسار


class SignUpScreen extends StatelessWidget {
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
              // العودة إلى شاشة تسجيل الدخول باستخدام ترانزيشن السحب من اليسار
              // نستخدم pushReplacement لاستبدال الشاشة الحالية (SignUp) بشاشة Login
              Navigator.of(context).pushReplacement(
                createSlideFromLeftTransitionRoute(destinationPage: LoginScreen()),
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
            child: Text('تسجيل الدخول', textAlign: TextAlign.center),
          ),
        ),
         SizedBox(height: 20),
         // يمكن إضافة عناصر أخرى في اللوحة الجانبية هنا
         Text('أو أنشئ حساب', style: TextStyle(color: Colors.white70)),
      ],
    );

    // محتوى الشاشة الرئيسي (نموذج إنشاء حساب أو نص)
    final mainContentWidget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'أنشئ حساب جديد',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
           // هنا يمكنك إضافة حقول إدخال لإنشاء حساب وزر إنشاء الحساب الفعلي
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30.0),
             child: TextField(
               decoration: InputDecoration(labelText: 'اسم المستخدم'),
             ),
           ),
            SizedBox(height: 10),
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
            SizedBox(height: 10),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30.0),
             child: TextField(
               obscureText: true,
               decoration: InputDecoration(labelText: 'تأكيد كلمة المرور'),
             ),
           ),
           SizedBox(height: 20),
           ElevatedButton(onPressed: (){ /* TODO: Signup Logic */ }, child: Text('إنشاء حساب')),
        ],
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء حساب'),
        centerTitle: true,
      ),
      body: SidePanelLayout(
        mainContent: mainContentWidget, // المحتوى الرئيسي هو نموذج إنشاء حساب
        panelContent: panelContentWidget, // محتوى اللوحة هو الزر
        panelPosition: ClipSide.left, // اللوحة الجانبية على اليسار
         panelWidth: 150.0, // يمكنك تخصيص عرض اللوحة
        panelColor: Colors.blue.shade800, // لون اللوحة
        panelCurveRadius: 40.0, // نصف قطر الانحناء
      ),
    );
  }
}