import 'dart:math' show pi;

import 'package:expenses/core/extenstions.dart';
import 'package:expenses/core/manager/string_manager.dart';
import 'package:flutter/material.dart';


class DoughnutChartPainter extends CustomPainter {
  final List<Color> colors;
  final List<double> percentages;
  final Animation<double> sweepAngleAnimation;
  final Animation<double> text;
  final BuildContext context;

  DoughnutChartPainter({
    required this.percentages,
    required this.colors,
    required this.sweepAngleAnimation,
    required this.text,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width < 350 ? size.width / 2.2 : size.height / 2.5;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double startAngle = -pi / 2;
    double padding = 0.1;
    double total = percentages.reduce((a, b) => a + b);

    for (int i = 0; i < percentages.length; i++) {
      double sweepAngle =
          (percentages[i] / total) * sweepAngleAnimation.value - padding;
      Path path = Path();
      path.arcTo(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startAngle,
        sweepAngle,
        true,
      );

      canvas.drawPath(
          path,
          Paint()
            ..color = colors[i]
            ..style = PaintingStyle.stroke
            ..strokeWidth = 5.0
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round);

      startAngle += sweepAngle + padding;
    }

    TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: StringManager.totalSpent,
          children: [
            TextSpan(text: text.value.currency, style: Theme.of(context).textTheme.titleLarge)
          ],
          
          style: Theme.of(context).textTheme.titleSmall),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    double textX = centerX - textPainter.width / 2;
    double textY = centerY - textPainter.height / 2;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(DoughnutChartPainter oldDelegate) => true;
}
