import 'package:flutter/services.dart';

class UiConstants {
  const UiConstants._();

  /// shimmer
  static const shimmerItemCount = 20;

  /// material app
  static const materialAppTitle = 'Nord';
  // ignore: avoid_hard_coded_colors
  static const taskMenuMaterialAppColor = Color(0xFFF8F7F4);

  /// orientation
  static const mobileOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  static const tabletOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  /// status bar color
  static const systemUiOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Color(0x00000000),
    systemStatusBarContrastEnforced: false,
    systemNavigationBarColor: Color(0xFFF8F7F4),
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarContrastEnforced: false,
  );

  static const textFieldTextStyleHeight = 1.3;
}
