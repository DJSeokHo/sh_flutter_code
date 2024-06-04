import 'package:flutter/material.dart';

import 'font_size.dart';

const kTextTheme = _TextTheme();

class _TextTheme {
  const _TextTheme();

  static String get _fontFamily => 'Suit';

  static final TextStyle _baseTextStyle = TextStyle(
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
    color: Colors.black,
  );

  TextStyle ultraLight({
    FontSize fontSize = FontSize.s14,
    TextDecoration? decoration,
    Color? color,
  }) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize.size,
        fontWeight: FontWeight.w200,
        decoration: decoration,
        color: color,
      );

  TextStyle light({
    FontSize fontSize = FontSize.s14,
    TextDecoration? decoration,
    Color? color,
  }) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize.size,
        fontWeight: FontWeight.w300,
        decoration: decoration,
        color: color,
      );

  TextStyle regular({
    FontSize fontSize = FontSize.s14,
    TextDecoration? decoration,
    Color? color,
  }) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize.size,
        fontWeight: FontWeight.w400,
        decoration: decoration,
        color: color,
      );

  TextStyle medium({
    FontSize fontSize = FontSize.s14,
    TextDecoration? decoration,
    Color? color,
  }) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize.size,
        fontWeight: FontWeight.w500,
        decoration: decoration,
        color: color,
      );

  TextStyle bold({
    FontSize fontSize = FontSize.s14,
    TextDecoration? decoration,
    Color? color,
  }) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize.size,
        fontWeight: FontWeight.w600,
        decoration: decoration,
        color: color,
      );

  TextStyle heavy({
    FontSize fontSize = FontSize.s14,
    TextDecoration? decoration,
    Color? color,
  }) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize.size,
        fontWeight: FontWeight.w700,
        decoration: decoration,
        color: color,
      );

  TextStyle ultraBold({
    FontSize fontSize = FontSize.s14,
    TextDecoration? decoration,
    Color? color,
  }) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize.size,
        fontWeight: FontWeight.w800,
        decoration: decoration,
        color: color,
      );
}
