// File: curved_side_panel_widget.dart
import 'package:flutter/material.dart';
import 'package:shaglat/transm.dart';
 // استيراد الكليبر

class CurvedSidePanelWidget extends StatelessWidget {
  final Color backgroundColor;
  final double width;
  final double curveRadius;
  final ClipSide clipSide; // جانب الانحناء في هذا الـ Widget
  final Widget panelContent; // المحتوى داخل اللوحة (مثل الزر)

  CurvedSidePanelWidget({
    this.backgroundColor = Colors.blue,
    this.width = 150.0, // عرض افتراضي
    this.curveRadius = 40.0,
    this.clipSide = ClipSide.right, // افتراضياً الانحناء على اليمين
    required this.panelContent, // المحتوى مطلوب
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       width: width,
       // لا نضع اللون هنا مباشرة، نستخدم ClipPath
       child: ClipPath(
         clipper: SidePanelEndCurvesClipper(
           cornerRadius: curveRadius,
           clipSide: clipSide, // تمرير جانب الانحناء للكليبر
         ),
         child: Container(
           color: backgroundColor, // لون اللوحة
           child: SafeArea( // حماية من تداخل واجهة النظام
             child: panelContent, // عرض المحتوى الذي تم تمريره
           ),
         ),
       ),
    );
  }
}