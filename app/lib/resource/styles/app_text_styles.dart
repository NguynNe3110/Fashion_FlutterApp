// ignore_for_file: avoid_hard_coded_text_style
import 'package:flutter/material.dart';

import '../../app.dart';

/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary

class AppTextStyles {
  AppTextStyles._();
  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    // height: 1.0,
  );

  static TextStyle s14w400Primary({double? tablet, double? ultraTablet}) =>
      _baseTextStyle.merge(
        TextStyle(
          fontSize: Dimens.d14.responsive(
            tablet: tablet,
            ultraTablet: ultraTablet,
          ),
          fontWeight: FontWeight.w400,
          color: AppColors.ink,
          fontFamily: 'Inter',
        ),
      );

  static TextStyle s14w400Secondary({double? tablet, double? ultraTablet}) =>
      _baseTextStyle.merge(
        TextStyle(
          fontSize: Dimens.d14.responsive(
            tablet: tablet,
            ultraTablet: ultraTablet,
          ),
          fontWeight: FontWeight.w400,
          color: AppColors.ink3,
          fontFamily: 'Inter',
        ),
      );

  // Nord Typography
  static TextStyle h1Serif({double? fontSize}) => _baseTextStyle.copyWith(
    fontFamily: 'Instrument Serif',
    fontSize: fontSize ?? Dimens.d40.responsive(),
    fontWeight: FontWeight.w400,
    height: 1.02,
    letterSpacing: -0.02,
    color: AppColors.ink,
  );

  static TextStyle h2Serif({double? fontSize}) => _baseTextStyle.copyWith(
    fontFamily: 'Instrument Serif',
    fontSize: fontSize ?? Dimens.d28.responsive(),
    fontWeight: FontWeight.w400,
    height: 1.05,
    letterSpacing: -0.01,
    color: AppColors.ink,
  );

  static TextStyle eyebrow() => _baseTextStyle.copyWith(
    fontFamily: 'JetBrains Mono',
    fontSize: Dimens.d10.responsive(),
    letterSpacing: 0.16,
    color: AppColors.ink3,
  );

  static TextStyle sectionTitle() => _baseTextStyle.copyWith(
    fontFamily: 'Instrument Serif',
    fontSize: Dimens.d22.responsive(),
    fontWeight: FontWeight.w400,
    letterSpacing: -0.01,
    color: AppColors.ink,
  );

  static TextStyle linkText() => _baseTextStyle.copyWith(
    fontFamily: 'Inter',
    fontSize: Dimens.d12.responsive(),
    color: AppColors.ink3,
    decoration: TextDecoration.underline,
  );
}
