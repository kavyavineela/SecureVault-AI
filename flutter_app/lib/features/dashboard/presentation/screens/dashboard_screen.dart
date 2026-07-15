import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import '../../../password_vault/presentation/screens/password_vault_screen.dart';
import '../../../secure_notes/presentation/screens/secure_notes_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecureVault AI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome, Kavya 👋",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Your Digital Security Dashboard",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  DashboardCard(
                    icon: Icons.lock,
                    title: "Passwords",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PasswordVaultScreen(),
                        ),
                      );
                    },
                  ),

                  DashboardCard(
  icon: Icons.note,
  title: "Secure Notes",
  onTap: () {},
),

                  DashboardCard(
                    icon: Icons.folder,
                    title: "Secure Files",
                    onTap: () {},
                  ),

                  DashboardCard(
                    icon: Icons.image,
                    title: "Secure Images",
                    onTap: () {},
                  ),

                  DashboardCard(
                    icon: Icons.language,
                    title: "Website Scanner",
                    onTap: () {},
                  ),

                  DashboardCard(
                    icon: Icons.smart_toy,
                    title: "AI Security",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}