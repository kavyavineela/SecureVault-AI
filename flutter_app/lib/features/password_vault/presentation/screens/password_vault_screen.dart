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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Password...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: provider.setSearchQuery,
                ),
              ),

              Expanded(
                child: provider.filteredPasswords.isEmpty
                    ? const Center(
                        child: Text(
                          "No Passwords Found",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: provider.filteredPasswords.length,
                        itemBuilder: (context, index) {
                          final password =
                              provider.filteredPasswords[index];

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
                      ),
              ),
            ],
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