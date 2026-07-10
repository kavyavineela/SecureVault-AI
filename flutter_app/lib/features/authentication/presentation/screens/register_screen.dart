import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Icon(
                Icons.person_add_alt_1,
                size: 90,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Create your SecureVault AI account",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              const CustomTextField(
                label: "Full Name",
                icon: Icons.person,
              ),

              const SizedBox(height: 20),

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

              const SizedBox(height: 20),

              const CustomTextField(
                label: "Confirm Password",
                icon: Icons.lock_outline,
                obscureText: true,
              ),

              const SizedBox(height: 30),

              CustomButton(
                text: "REGISTER",
                onPressed: () {},
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Login"),
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