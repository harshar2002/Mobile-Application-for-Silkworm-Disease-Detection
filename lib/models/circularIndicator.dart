import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  final double value; // Value between 0 and 10
  final double size; // Size of the circular indicator
  final Color color;
  final double value2; // Color of the filled portion

  const CircularIndicator({
    super.key,
    required this.value,
    required this.value2,
    this.size = 100,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: CircularPainter(value: value, color: color, value2: value2),
    );
  }
}

class CircularPainter extends CustomPainter {
  final double value;
  final double value2;
  final Color color;

  CircularPainter({
    required this.value,
    required this.value2,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Paint fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    double percentage = value / value2; // Normalize value to percentage

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      math.pi,
      math.pi * percentage * 2,
      false,
      bgPaint,
    );
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, bgPaint);
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      math.pi,
      math.pi * percentage * 2,
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
