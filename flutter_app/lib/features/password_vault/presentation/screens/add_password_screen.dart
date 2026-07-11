import 'package:flutter/material.dart';
import '../../../authentication/presentation/widgets/custom_button.dart';
import '../../../authentication/presentation/widgets/custom_text_field.dart';

class AddPasswordScreen extends StatelessWidget {
  const AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              label: "Website",
              icon: Icons.language,
            ),

            const SizedBox(height: 20),

            CustomTextField(
              label: "Username / Email",
              icon: Icons.person,
            ),

            const SizedBox(height: 20),

            CustomTextField(
              label: "Password",
              icon: Icons.lock,
              obscureText: true,
            ),

            const SizedBox(height: 40),

            CustomButton(
              text: "SAVE PASSWORD",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}