// File: side_panel_end_curves_clipper.dart
import 'package:flutter/material.dart';


// لتحديد جانب الانحناء
enum ClipSide { left, right }

// Clipper لإنشاء شكل منحني عند الزوايا العلوية والسفلية
class SidePanelEndCurvesClipper extends CustomClipper<Path> {
  final double cornerRadius; // نصف قطر الانحناء عند الزوايا
  final ClipSide clipSide; // جانب الانحناء (يسار أو يمين)

  SidePanelEndCurvesClipper({this.cornerRadius = 40, this.clipSide = ClipSide.right});

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (clipSide == ClipSide.right) {
      // شكل منحني على الحافة اليمنى (لللوحة التي ستظهر على اليسار)
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width - cornerRadius, size.height);

      var controlPointBottom = Offset(size.width, size.height);
      var endPointBottom = Offset(size.width, size.height - cornerRadius);
      path.quadraticBezierTo(
          controlPointBottom.dx, controlPointBottom.dy,
          endPointBottom.dx, endPointBottom.dy);


      path.lineTo(size.width, cornerRadius);

      var controlPointTop = Offset(size.width, 0);
      var endPointTop = Offset(size.width - cornerRadius, 0);
      path.quadraticBezierTo(
          controlPointTop.dx, controlPointTop.dy,
          endPointTop.dx, endPointTop.dy);

      path.close();

    } else { // clipSide == ClipSide.left
       // شكل منحني على الحافة اليسرى (لللوحة التي ستظهر على اليمين)
       path.moveTo(size.width, 0);
       path.lineTo(size.width, size.height);
       path.lineTo(cornerRadius, size.height); // اذهب إلى اليسار قبل بداية الانحناء السفلي

       var controlPointBottom = Offset(0, size.height);
       var endPointBottom = Offset(0, size.height - cornerRadius);
       path.quadraticBezierTo(
           controlPointBottom.dx, controlPointBottom.dy,
           endPointBottom.dx, endPointBottom.dy);

       path.lineTo(0, cornerRadius); // اذهب إلى الأعلى على الحافة اليسرى قبل الانحناء العلوي

       var controlPointTop = Offset(0, 0);
       var endPointTop = Offset(cornerRadius, 0);
       path.quadraticBezierTo(
           controlPointTop.dx, controlPointTop.dy,
           endPointTop.dx, endPointTop.dy);

       path.close();
    }


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    if (oldClipper is SidePanelEndCurvesClipper) {
      return oldClipper.cornerRadius != cornerRadius || oldClipper.clipSide != clipSide;
    }
    return true;
  }
}

