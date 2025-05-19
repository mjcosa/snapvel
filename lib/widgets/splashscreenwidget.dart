import 'package:flutter/material.dart';
import 'dart:math' as math;

class DecorativeCircle extends StatelessWidget {
  final double width;
  final double height;
  final bool isTopRight;

  const DecorativeCircle({
    Key? key,
    required this.width,
    required this.height,
    required this.isTopRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: CirclePainter(isTopRight: isTopRight),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final bool isTopRight;

  CirclePainter({required this.isTopRight});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFF7622)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 94.0;

    final double radius = isTopRight ? 96.5 : 97.9;
    final Offset center = isTopRight
        ? Offset(size.width * 0.88, size.height * -0.068)
        : Offset(size.width * 0.01, size.height * 0.846);

    // Create a path for the dashed circle
    final Path path = Path();
    path.addArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * math.pi,
    );

    // Draw dashed circle
    const dashLength = 4.0;
    const dashSpace = 4.0;
    final pathMetrics = path.computeMetrics().first;
    var distance = 0.0;

    while (distance < pathMetrics.length) {
      final start = distance;
      final end = (distance + dashLength);
      if (end <= pathMetrics.length) {
        final extractPath = pathMetrics.extractPath(start, end);
        canvas.drawPath(extractPath, paint);
      }
      distance += dashLength + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
