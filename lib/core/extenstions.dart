import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizePadding on num {
  SizedBox get emptyWidth => SizedBox(width: toDouble());
  SizedBox get emptyHeight => SizedBox(height: toDouble());
}

extension DurationExt on num {
  Duration get dms => Duration(milliseconds: toInt());
  Duration get ds => Duration(seconds: toInt());
}

extension NumbersConverter on num {
  EdgeInsetsGeometry get pt => EdgeInsets.only(top: toDouble());
  EdgeInsetsGeometry get pb => EdgeInsets.only(bottom: toDouble());
  EdgeInsetsGeometry get pl => EdgeInsets.only(left: toDouble());
  EdgeInsetsGeometry get pr => EdgeInsets.only(right: toDouble());
  EdgeInsetsGeometry get psv => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsetsGeometry get psh => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsetsGeometry get p => EdgeInsets.all(toDouble());
  String percentage(double s) => "${(toDouble() / s * 100).round()} %";
  String get currency => NumberFormat.simpleCurrency().format(toDouble());
}

extension Currency on double {}

extension StringExtension on String {
  String capitalize() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  Color get strToColor => Color(int.parse(this));
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
