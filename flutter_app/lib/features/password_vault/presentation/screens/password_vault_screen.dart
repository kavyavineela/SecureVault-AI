import 'package:flutter/material.dart';

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}