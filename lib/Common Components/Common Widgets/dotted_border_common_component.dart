
import 'dart:ui';

import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final BorderRadius? borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DottedBorderPainter({
    this.borderRadius,
    this.color = Colors.blue,
    this.strokeWidth = 2,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: borderRadius!.topLeft,
      topRight: borderRadius!.topRight,
      bottomLeft: borderRadius!.bottomLeft,
      bottomRight: borderRadius!.bottomRight,
    );

    final borderPath = Path()..addRRect(rrect);
    final dashPath = Path();

    for (PathMetric pathMetric in borderPath.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


