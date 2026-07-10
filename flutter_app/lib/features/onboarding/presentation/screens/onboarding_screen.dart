import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Colors.blue
            : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: const [
                  OnboardingPage(
                    icon: Icons.security,
                    title: "Protect Your Passwords",
                    subtitle:
                        "Store all your passwords securely using military-grade encryption.",
                  ),
                  OnboardingPage(
                    icon: Icons.phishing,
                    title: "AI Phishing Detection",
                    subtitle:
                        "Detect suspicious websites before they steal your personal information.",
                  ),
                  OnboardingPage(
                    icon: Icons.lock,
                    title: "Your Digital Vault",
                    subtitle:
                        "Secure your notes, documents, images, and passwords in one place.",
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDot(0),
                buildDot(1),
                buildDot(2),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}