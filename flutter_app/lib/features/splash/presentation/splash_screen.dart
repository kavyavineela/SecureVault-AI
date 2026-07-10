import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.darkBlue,
              AppColors.primaryBlue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.security_rounded,
                size: 100,
                color: AppColors.white,
                ),

              const SizedBox(height: 20),

              const Text(
                "SecureVault AI",
                style: AppTextStyles.appTitle,
              ),

              const SizedBox(height: 10),

              const Text(
                "Protecting Your Digital Life",
                style: AppTextStyles.subtitle,
              ),

              const SizedBox(height: 40),

              const CircularProgressIndicator(
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}