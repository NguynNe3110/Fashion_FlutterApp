// ignore_for_file: avoid_hard_coded_colors
import 'package:flutter/material.dart';

import '../../app.dart';

class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryGradient,
  });

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  /// gradient
  final LinearGradient primaryGradient;

  static const defaultAppColor = AppColors(
    primaryColor: Color.fromARGB(255, 166, 168, 254),
    secondaryColor: Color.fromARGB(255, 62, 62, 70),
    primaryTextColor: Color.fromARGB(255, 62, 62, 70),
    secondaryTextColor: Color.fromARGB(255, 166, 168, 254),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  static const darkThemeColor = AppColors(
    primaryColor: Color.fromARGB(255, 62, 62, 70),
    secondaryColor: Color.fromARGB(255, 166, 168, 254),
    primaryTextColor: Color.fromARGB(255, 166, 168, 254),
    secondaryTextColor: Color.fromARGB(255, 62, 62, 70),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }

  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    LinearGradient? primaryGradient,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }
}
//
// import 'package:flutter/material.dart';
// // có lẽ dùng soft pink và sky
// /// AppColors
// /// ---------------------------------------------------------------------------
// /// Hệ thống màu dùng chung cho toàn bộ ứng dụng.
// ///
// /// PHONG CÁCH:
// /// - Pastel / Soft / Cute
// /// - Màu nền rất sáng
// /// - Màu chính có saturation vừa phải
// /// - Chữ dùng tone xám xanh/tím đậm thay vì đen tuyệt đối
// ///
// /// NGUYÊN TẮC DÙNG MÀU:
// /// 1. UI nên lấy màu từ file này, KHÔNG tự viết Color(...) trong Screen.
// /// 2. Ưu tiên SEMANTIC COLOR ở cuối file:
// ///      AppColors.textPrimary
// ///      AppColors.background
// ///      AppColors.primary
// ///      AppColors.buttonPrimary
// ///      AppColors.border
// ///      AppColors.success
// ///    thay vì dùng trực tiếp pastelPink500.
// ///
// /// 3. Nhóm "Palette" ở đầu file là màu gốc.
// ///    Nhóm "Semantic" bên dưới quyết định màu đó được dùng vào đâu.
// ///
// /// 4. Khi thiết kế một UI mới:
// ///      Background  -> background / backgroundSoft
// ///      Card        -> surface / surfacePink / surfaceBlue...
// ///      Text chính  -> textPrimary
// ///      Text phụ    -> textSecondary
// ///      Border      -> border / borderStrong
// ///      Nút chính   -> buttonPrimary
// ///      Nút phụ     -> buttonSecondary
// ///      Thành công  -> success
// ///      Cảnh báo    -> warning
// ///      Lỗi         -> error
// ///
// /// 5. Nếu không tìm thấy màu phù hợp, trước tiên xem toàn bộ file này.
// ///    Chỉ tạo màu mới khi màu hiện tại thực sự không phù hợp.
// ///
// /// ---------------------------------------------------------------------------
// /// COLOR SCALE
// /// ---------------------------------------------------------------------------
// /// 50  = cực nhạt, thường dùng background
// /// 100 = background / surface
// /// 200 = surface đậm hơn / border mềm
// /// 300 = border / disabled
// /// 400 = màu pastel rõ hơn
// /// 500 = màu chính
// /// 600 = màu nhấn / pressed
// /// 700 = màu đậm, có thể dùng cho text/icon trên nền sáng
// ///
// /// ---------------------------------------------------------------------------
//
// abstract final class AppColors {
//   AppColors._();
//
//   // ==========================================================================
//   // 1. RAW PASTEL PALETTE
//   // ==========================================================================
//   //
//   // Các màu này được lấy cảm hứng trực tiếp từ palette trong hình tham khảo:
//   //
//   // Pink:   #FFC0C9
//   // Cyan:   #BCF0F3
//   // Aqua:   #D7FDFF
//   // Yellow: #FFF9C3
//   //
//   // Blue/Pink:
//   // #B5CDFF #DAE8FF #FEABC5 #FFD4E1
//   //
//   // Blue/Yellow/Green:
//   // #FFA8D6 #FFD1E9 #BADF93 #CFE5B7
//   //
//   // Không nên dùng các màu RAW trực tiếp trong UI nếu có semantic color
//   // tương ứng ở phần cuối file.
//
//   // --------------------------------------------------------------------------
//   // Pink
//   // --------------------------------------------------------------------------
//
//   static const Color pink50 = Color(0xFFFFF5F7);
//   static const Color pink100 = Color(0xFFFFE9ED);
//   static const Color pink200 = Color(0xFFFFD9E0);
//   static const Color pink300 = Color(0xFFFFC0C9);
//   static const Color pink400 = Color(0xFFFFA8B7);
//   static const Color pink500 = Color(0xFFFF8FA3);
//   static const Color pink600 = Color(0xFFFF718B);
//   static const Color pink700 = Color(0xFFE95F79);
//
//   // --------------------------------------------------------------------------
//   // Soft Pink
//   // --------------------------------------------------------------------------
//
//   static const Color softPink50 = Color(0xFFFFF9FB);
//   static const Color softPink100 = Color(0xFFFFF0F5);
//   static const Color softPink200 = Color(0xFFFFE1EC);
//   static const Color softPink300 = Color(0xFFFFD4E1);
//   static const Color softPink400 = Color(0xFFFFBFD4);
//   static const Color softPink500 = Color(0xFFFFA3C1);
//
//   // --------------------------------------------------------------------------
//   // Blue
//   // --------------------------------------------------------------------------
//
//   static const Color blue50 = Color(0xFFF5F9FF);
//   static const Color blue100 = Color(0xFFEAF2FF);
//   static const Color blue200 = Color(0xFFDAE8FF);
//   static const Color blue300 = Color(0xFFB5CDFF);
//   static const Color blue400 = Color(0xFF9AB9F5);
//   static const Color blue500 = Color(0xFF82A8ED);
//   static const Color blue600 = Color(0xFF6890DE);
//   static const Color blue700 = Color(0xFF5279C5);
//
//   // --------------------------------------------------------------------------
//   // Cyan / Aqua
//   // --------------------------------------------------------------------------
//
//   static const Color cyan50 = Color(0xFFF5FEFF);
//   static const Color cyan100 = Color(0xFFE9FCFD);
//   static const Color cyan200 = Color(0xFFD7FDFF);
//   static const Color cyan300 = Color(0xFFBCF0F3);
//   static const Color cyan400 = Color(0xFFA3E5E9);
//   static const Color cyan500 = Color(0xFF86D9DE);
//   static const Color cyan600 = Color(0xFF67C4CB);
//   static const Color cyan700 = Color(0xFF4FAAB1);
//
//   // --------------------------------------------------------------------------
//   // Sky Blue
//   // --------------------------------------------------------------------------
//
//   static const Color sky50 = Color(0xFFF4FBFF);
//   static const Color sky100 = Color(0xFFE7F6FF);
//   static const Color sky200 = Color(0xFFD8EEFF);
//   static const Color sky300 = Color(0xFFBFE5FF);
//   static const Color sky400 = Color(0xFFA8D8FF);
//   static const Color sky500 = Color(0xFF8CCAF5);
//   static const Color sky600 = Color(0xFF70B5E3);
//
//   // --------------------------------------------------------------------------
//   // Yellow / Cream
//   // --------------------------------------------------------------------------
//
//   static const Color yellow50 = Color(0xFFFFFEF4);
//   static const Color yellow100 = Color(0xFFFFFDEB);
//   static const Color yellow200 = Color(0xFFFFF9C3);
//   static const Color yellow300 = Color(0xFFFFF3A5);
//   static const Color yellow400 = Color(0xFFFFE982);
//   static const Color yellow500 = Color(0xFFFFDE68);
//   static const Color yellow600 = Color(0xFFF2CD50);
//
//   // --------------------------------------------------------------------------
//   // Green
//   // --------------------------------------------------------------------------
//
//   static const Color green50 = Color(0xFFF7FCEF);
//   static const Color green100 = Color(0xFFEFF9E5);
//   static const Color green200 = Color(0xFFE0F2D2);
//   static const Color green300 = Color(0xFFCFE5B7);
//   static const Color green400 = Color(0xFFBADF93);
//   static const Color green500 = Color(0xFFA8D47E);
//   static const Color green600 = Color(0xFF8DBE63);
//   static const Color green700 = Color(0xFF729F4D);
//
//   // --------------------------------------------------------------------------
//   // Mint
//   // --------------------------------------------------------------------------
//
//   static const Color mint50 = Color(0xFFF4FFFB);
//   static const Color mint100 = Color(0xFFE9FAF3);
//   static const Color mint200 = Color(0xFFD5F3E6);
//   static const Color mint300 = Color(0xFFBCE9D6);
//   static const Color mint400 = Color(0xFF9DDBBF);
//   static const Color mint500 = Color(0xFF7FCAAA);
//
//   // --------------------------------------------------------------------------
//   // Lavender / Purple
//   // --------------------------------------------------------------------------
//
//   static const Color lavender50 = Color(0xFFFAF7FF);
//   static const Color lavender100 = Color(0xFFF3EDFF);
//   static const Color lavender200 = Color(0xFFE9DEFF);
//   static const Color lavender300 = Color(0xFFD9C5FF);
//   static const Color lavender400 = Color(0xFFC5A7F5);
//   static const Color lavender500 = Color(0xFFB08BEA);
//   static const Color lavender600 = Color(0xFF9871D3);
//
//   // --------------------------------------------------------------------------
//   // Peach
//   // --------------------------------------------------------------------------
//
//   static const Color peach50 = Color(0xFFFFFAF6);
//   static const Color peach100 = Color(0xFFFFF0E8);
//   static const Color peach200 = Color(0xFFFFE2D2);
//   static const Color peach300 = Color(0xFFFFCCB3);
//   static const Color peach400 = Color(0xFFFFB18F);
//   static const Color peach500 = Color(0xFFFF9970);
//
//   // ==========================================================================
//   // 2. NEUTRAL COLORS
//   // ==========================================================================
//   //
//   // Không dùng pure black (#000000) cho text thông thường.
//   // Pastel UI hợp với dark blue-gray / purple-gray hơn.
//
//   static const Color white = Color(0xFFFFFFFF);
//   static const Color black = Color(0xFF000000);
//
//   // App background chính
//   static const Color neutral50 = Color(0xFFFAFBFD);
//   static const Color neutral100 = Color(0xFFF4F6F9);
//   static const Color neutral200 = Color(0xFFE9ECF1);
//   static const Color neutral300 = Color(0xFFD9DEE7);
//   static const Color neutral400 = Color(0xFFBEC5D0);
//   static const Color neutral500 = Color(0xFF9CA5B3);
//   static const Color neutral600 = Color(0xFF7B8595);
//   static const Color neutral700 = Color(0xFF606A7A);
//   static const Color neutral800 = Color(0xFF3F4858);
//   static const Color neutral900 = Color(0xFF273142);
//
//   // ==========================================================================
//   // 3. TEXT COLORS
//   // ==========================================================================
//   //
//   // Đây là nhóm nên dùng nhiều nhất khi viết UI.
//   //
//   // textPrimary:
//   //   Tiêu đề, nội dung chính, tên sản phẩm, câu hỏi.
//   //
//   // textSecondary:
//   //   Mô tả, subtitle, thông tin phụ.
//   //
//   // textTertiary:
//   //   Hint, metadata, timestamp, placeholder.
//   //
//   // textDisabled:
//   //   Text của control disabled.
//   //
//   // textOnPrimary:
//   //   Text nằm trên màu buttonPrimary.
//   //
//   // textLink:
//   //   Link / action text.
//
//   static const Color textPrimary = Color(0xFF354052);
//   static const Color textSecondary = Color(0xFF667085);
//   static const Color textTertiary = Color(0xFF98A2B3);
//   static const Color textDisabled = Color(0xFFB8BEC8);
//   static const Color textPlaceholder = Color(0xFF9AA3B2);
//   static const Color textOnPrimary = Color(0xFFFFFFFF);
//   static const Color textOnDark = Color(0xFFFFFFFF);
//   static const Color textLink = Color(0xFF6B8FD6);
//
//   // Text theo màu accent
//   static const Color textPink = Color(0xFFE8758C);
//   static const Color textBlue = Color(0xFF6689C9);
//   static const Color textCyan = Color(0xFF4F9FA5);
//   static const Color textGreen = Color(0xFF719B52);
//   static const Color textPurple = Color(0xFF8767B8);
//   static const Color textWarning = Color(0xFF9B7B30);
//   static const Color textError = Color(0xFFB85D6C);
//
//   // ==========================================================================
//   // 4. BACKGROUND COLORS
//   // ==========================================================================
//
//   /// Background mặc định của Scaffold.
//   static const Color background = Color(0xFFFFFBFC);
//
//   /// Background hơi xanh.
//   static const Color backgroundBlue = Color(0xFFF7FAFF);
//
//   /// Background hơi cyan.
//   static const Color backgroundCyan = Color(0xFFF5FDFE);
//
//   /// Background hơi hồng.
//   static const Color backgroundPink = Color(0xFFFFF7F9);
//
//   /// Background hơi vàng.
//   static const Color backgroundYellow = Color(0xFFFFFDF5);
//
//   /// Background hơi xanh lá.
//   static const Color backgroundGreen = Color(0xFFF8FCF3);
//
//   /// Background tím rất nhẹ.
//   static const Color backgroundPurple = Color(0xFFFBF9FF);
//
//   /// Background disabled.
//   static const Color backgroundDisabled = Color(0xFFF0F2F5);
//
//   /// Background cho vùng nổi bật nhẹ.
//   static const Color backgroundHighlight = Color(0xFFFFF4F7);
//
//   // ==========================================================================
//   // 5. SURFACE / CARD
//   // ==========================================================================
//   //
//   // Dùng cho Card, Container, panel, bottom sheet, dialog...
//   //
//   // surface:
//   //   Card trắng mặc định.
//   //
//   // surfaceSoft:
//   //   Card không cần nổi bật.
//   //
//   // surfacePink / Blue / Cyan / Green / Yellow:
//   //   Card pastel theo ngữ cảnh.
//
//   static const Color surface = Color(0xFFFFFFFF);
//   static const Color surfaceSoft = Color(0xFFFCFCFD);
//   static const Color surfaceElevated = Color(0xFFFFFFFF);
//
//   static const Color surfacePink = Color(0xFFFFF0F4);
//   static const Color surfaceBlue = Color(0xFFEFF5FF);
//   static const Color surfaceCyan = Color(0xFFEAFBFC);
//   static const Color surfaceYellow = Color(0xFFFFFBEA);
//   static const Color surfaceGreen = Color(0xFFF0F8E9);
//   static const Color surfacePurple = Color(0xFFF5F0FF);
//   static const Color surfacePeach = Color(0xFFFFF1E9);
//
//   // ==========================================================================
//   // 6. BORDER / DIVIDER
//   // ==========================================================================
//
//   /// Border mặc định của TextField/Card/Input.
//   static const Color border = Color(0xFFE3E6EC);
//
//   /// Border nhẹ hơn.
//   static const Color borderSoft = Color(0xFFEDF0F4);
//
//   /// Border rõ hơn khi cần phân tách.
//   static const Color borderStrong = Color(0xFFCDD3DD);
//
//   /// Divider.
//   static const Color divider = Color(0xFFE9ECF1);
//
//   /// Border theo accent.
//   static const Color borderPink = Color(0xFFFFC0C9);
//   static const Color borderBlue = Color(0xFFB5CDFF);
//   static const Color borderCyan = Color(0xFFBCF0F3);
//   static const Color borderYellow = Color(0xFFFFF0A0);
//   static const Color borderGreen = Color(0xFFCFE5B7);
//   static const Color borderPurple = Color(0xFFD9C5FF);
//
//   // ==========================================================================
//   // 7. PRIMARY BRAND
//   // ==========================================================================
//   //
//   // Primary = màu nhận diện chính của app.
//   //
//   // Với style hình tham khảo, Pink là màu primary hợp lý.
//   //
//   // Dùng cho:
//   // - CTA chính
//   // - Button chính
//   // - Active tab
//   // - Selected state
//   // - Progress chính
//   // - Icon quan trọng
//   //
//   // Không dùng primary cho mọi thứ.
//
//   static const Color primary = pink500;
//   static const Color primaryLight = pink300;
//   static const Color primarySoft = pink100;
//   static const Color primaryDark = pink600;
//
//   // ==========================================================================
//   // 8. SECONDARY / ACCENT
//   // ==========================================================================
//
//   /// Accent xanh pastel.
//   static const Color secondary = cyan500;
//   static const Color secondaryLight = cyan300;
//   static const Color secondarySoft = cyan100;
//   static const Color secondaryDark = cyan600;
//
//   /// Accent xanh dương.
//   static const Color accentBlue = blue500;
//   static const Color accentBlueSoft = blue100;
//
//   /// Accent vàng.
//   static const Color accentYellow = yellow500;
//   static const Color accentYellowSoft = yellow100;
//
//   /// Accent xanh lá.
//   static const Color accentGreen = green500;
//   static const Color accentGreenSoft = green100;
//
//   /// Accent tím.
//   static const Color accentPurple = lavender500;
//   static const Color accentPurpleSoft = lavender100;
//
//   // ==========================================================================
//   // 9. BUTTON COLORS
//   // ==========================================================================
//   //
//   // Khi tạo button:
//   //
//   // Primary Button:
//   //   background: buttonPrimary
//   //   foreground: buttonPrimaryText
//   //
//   // Secondary Button:
//   //   background: buttonSecondary
//   //   foreground: buttonSecondaryText
//   //
//   // Outline:
//   //   background: buttonOutlineBackground
//   //   border: buttonOutlineBorder
//   //
//   // Disabled:
//   //   background: buttonDisabled
//   //   foreground: buttonDisabledText
//
//   static const Color buttonPrimary = primary;
//   static const Color buttonPrimaryPressed = primaryDark;
//   static const Color buttonPrimaryDisabled = pink200;
//   static const Color buttonPrimaryText = textOnPrimary;
//
//   static const Color buttonSecondary = cyan300;
//   static const Color buttonSecondaryPressed = cyan500;
//   static const Color buttonSecondaryText = textPrimary;
//
//   static const Color buttonOutlineBackground = Colors.transparent;
//   static const Color buttonOutlineBorder = primary;
//   static const Color buttonOutlineText = primaryDark;
//
//   static const Color buttonGhostBackground = Colors.transparent;
//   static const Color buttonGhostText = primaryDark;
//
//   static const Color buttonDisabled = neutral200;
//   static const Color buttonDisabledText = textDisabled;
//
//   // ==========================================================================
//   // 10. ICON COLORS
//   // ==========================================================================
//
//   /// Icon chính.
//   static const Color iconPrimary = textPrimary;
//
//   /// Icon phụ.
//   static const Color iconSecondary = textSecondary;
//
//   /// Icon mờ.
//   static const Color iconTertiary = textTertiary;
//
//   /// Icon disabled.
//   static const Color iconDisabled = textDisabled;
//
//   /// Icon active.
//   static const Color iconActive = primary;
//
//   /// Icon accent.
//   static const Color iconBlue = blue500;
//   static const Color iconCyan = cyan600;
//   static const Color iconGreen = green600;
//   static const Color iconYellow = yellow600;
//   static const Color iconPurple = lavender600;
//   static const Color iconPink = pink600;
//
//   // ==========================================================================
//   // 11. STATUS COLORS
//   // ==========================================================================
//   //
//   // SUCCESS:
//   //   Thành công, đúng, completed, active.
//   //
//   // WARNING:
//   //   Cảnh báo, retry, cần chú ý.
//   //
//   // ERROR:
//   //   Sai, lỗi, failed.
//   //
//   // INFO:
//   //   Thông tin, hint, announcement.
//
//   static const Color success = green500;
//   static const Color successLight = green200;
//   static const Color successBackground = green50;
//   static const Color successBorder = green300;
//   static const Color successText = green700;
//
//   static const Color warning = yellow500;
//   static const Color warningLight = yellow200;
//   static const Color warningBackground = yellow50;
//   static const Color warningBorder = yellow300;
//   static const Color warningText = textWarning;
//
//   static const Color error = pink600;
//   static const Color errorLight = pink200;
//   static const Color errorBackground = pink50;
//   static const Color errorBorder = pink300;
//   static const Color errorText = textError;
//
//   static const Color info = blue500;
//   static const Color infoLight = blue200;
//   static const Color infoBackground = blue50;
//   static const Color infoBorder = blue300;
//   static const Color infoText = blue700;
//
//   // ==========================================================================
//   // 12. FORM / INPUT
//   // ==========================================================================
//
//   static const Color inputBackground = surface;
//   static const Color inputBorder = border;
//   static const Color inputBorderFocused = primary;
//   static const Color inputBorderError = error;
//   static const Color inputBorderSuccess = success;
//   static const Color inputText = textPrimary;
//   static const Color inputHint = textPlaceholder;
//   static const Color inputLabel = textSecondary;
//   static const Color inputDisabledBackground = backgroundDisabled;
//   static const Color inputDisabledText = textDisabled;
//
//   // ==========================================================================
//   // 13. SELECTION / ACTIVE / INACTIVE
//   // ==========================================================================
//
//   static const Color selectedBackground = primarySoft;
//   static const Color selectedBorder = primary;
//   static const Color selectedIcon = primaryDark;
//   static const Color selectedText = textPink;
//
//   static const Color activeBackground = primarySoft;
//   static const Color active = primary;
//
//   static const Color inactive = neutral400;
//   static const Color inactiveBackground = neutral100;
//   static const Color inactiveText = textTertiary;
//
//   // ==========================================================================
//   // 14. CHIP / TAG
//   // ==========================================================================
//
//   static const Color chipPinkBackground = pink100;
//   static const Color chipPinkText = textPink;
//   static const Color chipPinkBorder = pink200;
//
//   static const Color chipBlueBackground = blue100;
//   static const Color chipBlueText = textBlue;
//   static const Color chipBlueBorder = blue200;
//
//   static const Color chipCyanBackground = cyan100;
//   static const Color chipCyanText = textCyan;
//   static const Color chipCyanBorder = cyan200;
//
//   static const Color chipGreenBackground = green100;
//   static const Color chipGreenText = textGreen;
//   static const Color chipGreenBorder = green200;
//
//   static const Color chipYellowBackground = yellow100;
//   static const Color chipYellowText = textWarning;
//   static const Color chipYellowBorder = yellow200;
//
//   static const Color chipPurpleBackground = lavender100;
//   static const Color chipPurpleText = textPurple;
//   static const Color chipPurpleBorder = lavender200;
//
//   // ==========================================================================
//   // 15. AVATAR / PROFILE
//   // ==========================================================================
//
//   static const Color avatarBackground = pink100;
//   static const Color avatarBackgroundBlue = blue100;
//   static const Color avatarBackgroundCyan = cyan100;
//   static const Color avatarBackgroundGreen = green100;
//   static const Color avatarBackgroundYellow = yellow100;
//   static const Color avatarBackgroundPurple = lavender100;
//
//   static const Color avatarBorder = white;
//
//   // ==========================================================================
//   // 16. NAVIGATION
//   // ==========================================================================
//
//   /// Bottom navigation background.
//   static const Color navBackground = surface;
//
//   /// Icon/tab đang active.
//   static const Color navActive = primary;
//
//   /// Icon/tab inactive.
//   static const Color navInactive = neutral500;
//
//   /// Background item active nếu bottom nav dùng pill.
//   static const Color navActiveBackground = primarySoft;
//
//   /// Border nav nếu cần.
//   static const Color navBorder = borderSoft;
//
//   // ==========================================================================
//   // 17. APP BAR
//   // ==========================================================================
//
//   static const Color appBarBackground = background;
//   static const Color appBarText = textPrimary;
//   static const Color appBarIcon = iconPrimary;
//   static const Color appBarBorder = borderSoft;
//
//   // ==========================================================================
//   // 18. DIVIDER / SEPARATOR
//   // ==========================================================================
//
//   static const Color separator = divider;
//   static const Color separatorSoft = borderSoft;
//
//   // ==========================================================================
//   // 19. OVERLAY / SCRIM
//   // ==========================================================================
//   //
//   // Dùng cho Dialog, BottomSheet, Drawer...
//   //
//   // Không cần tự tạo Color.fromRGBO(...) ở từng Screen.
//
//   static const Color overlayLight = Color(0x14000000);
//   static const Color overlayMedium = Color(0x33000000);
//   static const Color overlayDark = Color(0x66000000);
//
//   // ==========================================================================
//   // 20. SHIMMER / LOADING
//   // ==========================================================================
//
//   static const Color shimmerBase = neutral100;
//   static const Color shimmerHighlight = white;
//
//   static const Color loadingTrack = pink100;
//   static const Color loadingIndicator = primary;
//
//   // ==========================================================================
//   // 21. PROGRESS / SCORE
//   // ==========================================================================
//
//   static const Color progressTrack = pink100;
//   static const Color progressValue = primary;
//
//   static const Color scoreExcellent = green500;
//   static const Color scoreGood = cyan500;
//   static const Color scoreAverage = yellow500;
//   static const Color scoreLow = pink400;
//
//   // ==========================================================================
//   // 22. ANSWER / QUIZ STATES
//   // ==========================================================================
//   //
//   // Phù hợp với UI học tập / quiz.
//   //
//   // idle    -> chưa chọn
//   // selected -> đang chọn
//   // correct -> đúng
//   // wrong   -> sai
//   // retry   -> cho phép thử lại
//
//   static const Color answerIdleBackground = surface;
//   static const Color answerIdleBorder = border;
//
//   static const Color answerSelectedBackground = blue100;
//   static const Color answerSelectedBorder = blue400;
//   static const Color answerSelectedText = blue700;
//
//   static const Color answerCorrectBackground = green100;
//   static const Color answerCorrectBorder = green500;
//   static const Color answerCorrectText = green700;
//
//   static const Color answerWrongBackground = pink100;
//   static const Color answerWrongBorder = pink500;
//   static const Color answerWrongText = textError;
//
//   static const Color answerRetryBackground = yellow100;
//   static const Color answerRetryBorder = yellow500;
//   static const Color answerRetryText = textWarning;
//
//   // ==========================================================================
//   // 23. EMPTY STATE
//   // ==========================================================================
//
//   static const Color emptyStateIcon = neutral400;
//   static const Color emptyStateTitle = textPrimary;
//   static const Color emptyStateDescription = textSecondary;
//
//   // ==========================================================================
//   // 24. SPECIAL PASTEL COMBINATIONS
//   // ==========================================================================
//   //
//   // Các combo này hữu ích khi muốn tạo card/section có đúng "vibe" ảnh mẫu.
//
//   // Pink + Cyan + Yellow
//   static const Color comboPinkCyanBackground = Color(0xFFFFF7F9);
//   static const Color comboPinkCyanPrimary = pink300;
//   static const Color comboPinkCyanSecondary = cyan300;
//   static const Color comboPinkCyanAccent = yellow200;
//
//   // Blue + Pink
//   static const Color comboBluePinkBackground = Color(0xFFF7F9FF);
//   static const Color comboBluePinkPrimary = blue300;
//   static const Color comboBluePinkSecondary = softPink300;
//   static const Color comboBluePinkAccent = pink300;
//
//   // Blue + Yellow + Green
//   static const Color comboBlueGreenBackground = Color(0xFFFAFCF6);
//   static const Color comboBlueGreenPrimary = sky400;
//   static const Color comboBlueGreenSecondary = yellow200;
//   static const Color comboBlueGreenAccent = green400;
//
//   // Pink + Green
//   static const Color comboPinkGreenBackground = Color(0xFFFFFAFC);
//   static const Color comboPinkGreenPrimary = pink400;
//   static const Color comboPinkGreenSecondary = green400;
//   static const Color comboPinkGreenAccent = lavender300;
//
//   // ==========================================================================
//   // 25. GRADIENT COLORS
//   // ==========================================================================
//   //
//   // Chỉ chứa màu cho gradient.
//   // Nếu cần Gradient cụ thể, có thể dùng các màu này với LinearGradient.
//   //
//   // Ví dụ:
//   //
//   // LinearGradient(
//   //   colors: [
//   //     AppColors.gradientPinkStart,
//   //     AppColors.gradientPinkEnd,
//   //   ],
//   // )
//   //
//   // --------------------------------------------------------------------------
//
//   static const Color gradientPinkStart = Color(0xFFFFC0C9);
//   static const Color gradientPinkEnd = Color(0xFFFFE1EC);
//
//   static const Color gradientBlueStart = Color(0xFFB5CDFF);
//   static const Color gradientBlueEnd = Color(0xFFDAE8FF);
//
//   static const Color gradientCyanStart = Color(0xFFBCF0F3);
//   static const Color gradientCyanEnd = Color(0xFFD7FDFF);
//
//   static const Color gradientGreenStart = Color(0xFFBADF93);
//   static const Color gradientGreenEnd = Color(0xFFE0F2D2);
//
//   static const Color gradientPinkGreenStart = Color(0xFFFFA8D6);
//   static const Color gradientPinkGreenEnd = Color(0xFFCFE5B7);
//
//   static const Color gradientRainbowPink = Color(0xFFFFD4E1);
//   static const Color gradientRainbowBlue = Color(0xFFDAE8FF);
//   static const Color gradientRainbowCyan = Color(0xFFD7FDFF);
//   static const Color gradientRainbowYellow = Color(0xFFFFF9C3);
//
//   // ==========================================================================
//   // 26. COMMON UI SEMANTIC ALIASES
//   // ==========================================================================
//   //
//   // Những tên dưới đây được thiết kế để bạn có thể đọc code và hiểu ngay
//   // màu dùng ở đâu.
//   //
//   // Ví dụ:
//   //
//   // Container(color: AppColors.pageBackground)
//   // TextStyle(color: AppColors.heading)
//   // Border.all(color: AppColors.cardBorder)
//   // Icon(Icons.home, color: AppColors.iconActive)
//   //
//   // --------------------------------------------------------------------------
//
//   static const Color pageBackground = background;
//
//   static const Color cardBackground = surface;
//   static const Color cardBackgroundSoft = surfaceSoft;
//   static const Color cardBorder = border;
//
//   static const Color heading = textPrimary;
//   static const Color bodyText = textPrimary;
//   static const Color secondaryText = textSecondary;
//   static const Color caption = textTertiary;
//   static const Color hint = textPlaceholder;
//
//   static const Color primaryAction = buttonPrimary;
//   static const Color primaryActionPressed = buttonPrimaryPressed;
//   static const Color primaryActionText = buttonPrimaryText;
//
//   static const Color secondaryAction = buttonSecondary;
//   static const Color secondaryActionPressed = buttonSecondaryPressed;
//
//   static const Color fieldBackground = inputBackground;
//   static const Color fieldBorder = inputBorder;
//   static const Color fieldFocusedBorder = inputBorderFocused;
//   static const Color fieldErrorBorder = inputBorderError;
//
//   static const Color icon = iconPrimary;
//   static const Color iconMuted = iconTertiary;
//
//   static const Color successBg = successBackground;
//   static const Color warningBg = warningBackground;
//   static const Color errorBg = errorBackground;
//   static const Color infoBg = infoBackground;
//
//   // ==========================================================================
//   // 27. COLOR SWATCH HELPERS
//   // ==========================================================================
//   //
//   // Dùng khi cần tạo MaterialColor / debug palette.
//   // Không cần dùng trong UI hằng ngày.
//   //
//
//   static const MaterialColor primarySwatch = MaterialColor(
//     0xFFFF8FA3,
//     <int, Color>{
//       50: pink50,
//       100: pink100,
//       200: pink200,
//       300: pink300,
//       400: pink400,
//       500: pink500,
//       600: pink600,
//       700: pink700,
//       800: Color(0xFFD9536E),
//       900: Color(0xFFC4435D),
//     },
//   );
//
//   // ==========================================================================
//   // 28. DEBUG / DESIGN REFERENCE
//   // ==========================================================================
//   //
//   // 4 màu cốt lõi giống palette trong ảnh tham khảo.
//   // Có thể dùng khi muốn dựng một màn hình mới theo đúng concept.
//   //
//
//   static const Color designPink = Color(0xFFFFC0C9);
//   static const Color designCyan = Color(0xFFBCF0F3);
//   static const Color designAqua = Color(0xFFD7FDFF);
//   static const Color designYellow = Color(0xFFFFF9C3);
//
//   static const Color designBlue = Color(0xFFB5CDFF);
//   static const Color designBlueLight = Color(0xFFDAE8FF);
//   static const Color designPinkStrong = Color(0xFFFEABC5);
//   static const Color designPinkLight = Color(0xFFFFD4E1);
//
//   static const Color designGreen = Color(0xFFBADF93);
//   static const Color designGreenLight = Color(0xFFCFE5B7);
// }
