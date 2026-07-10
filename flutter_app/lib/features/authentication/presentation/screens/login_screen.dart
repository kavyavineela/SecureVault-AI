import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              const Icon(
                Icons.security,
                size: 90,
                color: Colors.blue,
              ),

              const SizedBox(height: 30),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Sign in to SecureVault AI",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              const CustomTextField(
                label: "Email",
                icon: Icons.email,
              ),

              const SizedBox(height: 20),

              const CustomTextField(
                label: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),

              const SizedBox(height: 15),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: "LOGIN",
                onPressed: () {},
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      print("Register button pressed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                           builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text("Register"),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}