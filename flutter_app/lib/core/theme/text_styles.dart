import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle appTitle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    letterSpacing: 1,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGrey,
  );
}