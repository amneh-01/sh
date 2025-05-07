// File: side_panel_layout.dart
import 'package:flutter/material.dart';
import 'package:shaglat/ten.dart';
import 'package:shaglat/transm.dart';
 // استيراد ClipSide enum

class SidePanelLayout extends StatelessWidget {
  final Widget mainContent; // المحتوى الرئيسي للشاشة
  final Widget panelContent; // المحتوى داخل اللوحة الجانبية (مثل الزر)
  final ClipSide panelPosition; // جانب ظهور اللوحة الجانبية (يسار أو يمين)
  final double panelWidth;
  final Color panelColor;
  final double panelCurveRadius;

  SidePanelLayout({
    required this.mainContent,
    required this.panelContent,
    required this.panelPosition,
    this.panelWidth = 150.0,
    this.panelColor = Colors.blue,
    this.panelCurveRadius = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    // بناء اللوحة الجانبية باستخدام CurvedSidePanelWidget
    final panelWidget = CurvedSidePanelWidget(
      width: panelWidth,
      backgroundColor: panelColor,
      curveRadius: panelCurveRadius,
      // جانب الانحناء في الكليبر هو عكس جانب ظهور اللوحة
      // إذا اللوحة على اليمين (ClipSide.right)، الانحناء على اليسار (ClipSide.left)
      // إذا اللوحة على اليسار (ClipSide.left)، الانحناء على اليمين (ClipSide.right)
      clipSide: panelPosition == ClipSide.right ? ClipSide.left : ClipSide.right,
      panelContent: panelContent,
    );

    // بناء المحتوى الرئيسي
    final mainContentWidget = Expanded(
      child: mainContent,
    );

    // ترتيب العناصر في Row حسب جانب اللوحة
    return Row(
      children: panelPosition == ClipSide.left
          ? [
              // اللوحة على اليسار، ثم المحتوى الرئيسي
              panelWidget,
              mainContentWidget,
            ]
          : [
              // المحتوى الرئيسي على اليسار، ثم اللوحة على اليمين
              mainContentWidget,
              panelWidget,
            ],
    );
  }
}