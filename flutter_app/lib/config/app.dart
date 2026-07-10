import 'package:flutter/material.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';

class SecureVaultApp extends StatelessWidget {
  const SecureVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SecureVault AI',
      home: const OnboardingScreen(),
    );
  }
}