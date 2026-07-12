import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/password_provider.dart';
import '../widgets/password_tile.dart';
import 'add_password_screen.dart';
import 'edit_password_screen.dart';

class PasswordVaultScreen extends StatelessWidget {
  const PasswordVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Vault"),
        centerTitle: true,
      ),
      body: Consumer<PasswordProvider>(
        builder: (context, provider, child) {
          if (provider.passwords.isEmpty) {
            return const Center(
              child: Text(
                "No Passwords Added Yet",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.passwords.length,
            itemBuilder: (context, index) {
              final password = provider.passwords[index];

              return PasswordTile(
                website: password.website,
                username: password.username,
                password: password.password,

                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditPasswordScreen(
                        index: index,
                        password: password,
                      ),
                    ),
                  );
                },

                onDelete: () {
                  provider.deletePassword(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddPasswordScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}