import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomBottomNavigationBar extends NotchedShape {
  const CustomBottomNavigationBar();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    const double s1 = 20.0;
    const double s2 = 8.0;
    const double addedRadius = 5.0;

    final double notchRadius = guest.width / 2.0 + addedRadius;
    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);
    final double cmp = b < 0 ? -1.0 : 1.0;

    final List<Offset> p = [
      Offset(a - s1, b),
      Offset(a, b),
      cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB),
      Offset(
          -1.0 *
              (cmp * p2yA > cmp * p2yB
                  ? Offset(p2xA, p2yA)
                  : Offset(p2xB, p2yB))
                  .dx,
          (cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB))
              .dy),
      Offset(-1.0 * (Offset(a, b)).dx, (Offset(a, b)).dy),
      Offset(-1.0 * (Offset(a - s1, b)).dx, (Offset(a - s1, b)).dy),
    ];

    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);

    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    for (int i = 0; i < p.length; i += 1) {
      p[i] += guest.center;
    }

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}