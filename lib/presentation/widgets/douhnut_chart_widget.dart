import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'custom_chart_painter.dart';

class AnimatedDoughnutChart extends StatefulWidget {
  final List<double> percentages;
  final List<Color> colors;
  final double totalSpent;

  const AnimatedDoughnutChart({
    super.key,
    required this.percentages,
    required this.colors,
    required this.totalSpent,
  });

  @override
  State<AnimatedDoughnutChart> createState() => _AnimatedDoughnutChartState();
}

class _AnimatedDoughnutChartState extends State<AnimatedDoughnutChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sweepAngleAnimation;
  late Animation<double> _totalSpentAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _sweepAngleAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    _totalSpentAnimation =
        Tween<double>(begin: 0, end: widget.totalSpent).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sweepAngleAnimation,
      builder: (context, child) {
        return CustomPaint(
          key: GlobalKey(),
          painter: DoughnutChartPainter(
              context: context,
              text: _totalSpentAnimation,
              percentages: widget.percentages,
              colors: widget.colors,
              sweepAngleAnimation: _sweepAngleAnimation),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
