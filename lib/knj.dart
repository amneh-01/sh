// File: slide_from_right_transition_route.dart
import 'package:flutter/material.dart';

// دالة لإنشاء مسار مع ترانزيشن Slide يسحب الشاشة من اليمين
PageRouteBuilder createSlideFromRightTransitionRoute({
  required Widget destinationPage, // الشاشة التي ننتقل إليها
  Duration transitionDuration = const Duration(milliseconds: 500), // مدة الحركة
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // تبدأ من اليمين
      const end = Offset.zero;        // تنتهي في الموضع الأصلي
      const curve = Curves.ease;      // منحنى الحركة

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child, // الشاشة الوجهة بأكملها
      );
    },
    transitionDuration: transitionDuration,
    reverseTransitionDuration: transitionDuration, // غالبا نفس المدة للعودة العكسية
  );
}



// File: slide_from_left_transition_route.dart


// دالة لإنشاء مسار مع ترانزيشن Slide يسحب الشاشة من اليسار
PageRouteBuilder createSlideFromLeftTransitionRoute({
  required Widget destinationPage, // الشاشة التي ننتقل إليها
  Duration transitionDuration = const Duration(milliseconds: 500), // مدة الحركة
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0); // تبدأ من اليسار
      const end = Offset.zero;         // تنتهي في الموضع الأصلي
      const curve = Curves.ease;       // منحنى الحركة

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child, // الشاشة الوجهة بأكملها
      );
    },
    transitionDuration: transitionDuration,
    reverseTransitionDuration: transitionDuration, // غالبا نفس المدة للعودة العكسية
  );
}