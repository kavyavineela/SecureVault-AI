import 'package:flutter/material.dart';
import 'add_password_screen.dart';

class PasswordVaultScreen extends StatelessWidget {
  const PasswordVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Vault"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "No Passwords Added Yet",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddPasswordScreen(),
      ),
    );
  },
        child: const Icon(Icons.add),
      ),
    );
  }
}