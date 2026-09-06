import 'package:flutter/material.dart';

// Giả sử bạn đã có AppColors ở đâu đó
// import 'app_colors.dart';

/// Quản lý ĐỘ DÀY và KIỂU ĐƯỜNG VIỀN (Stroke/Border)
/// Map với Android: Modifier.border(width, color)
class AppBorder {
  AppBorder._();

  // --- Độ dày tiêu chuẩn ---
  static const double thin = 0.5;
  static const double normal = 1.0;
  static const double thick = 2.0;
  static const double extraThick = 4.0;

  // --- Các mẫu viền thường dùng (Kết hợp độ dày + màu) ---

  /// Viền mảnh, màu xám nhẹ (Dùng cho Divider, Container thường)
  static Border get light => Border.all(
    width: thin,
    color: Colors.grey.shade300, // Hoặc AppColors.borderLight
  );

  /// Viền tiêu chuẩn (Dùng cho TextField, Button Outlined)
  static Border get standart => Border.all(
    width: normal,
    color: Colors.grey.shade400,
  );

  /// Viền dày, màu chủ đạo (Dùng cho trạng thái Selected/Focused)
  static Border get primaryThick => Border.all(
    width: thick,
    color: Colors.blue, // Hoặc AppColors.primary
  );

  /// Viền nét đứt (Dùng cho vùng thả ảnh, upload file)
  static Border get dashed => Border.all(
    width: normal,
    color: Colors.grey.shade400,
    strokeAlign: BorderSide.strokeAlignInside,
  );
}