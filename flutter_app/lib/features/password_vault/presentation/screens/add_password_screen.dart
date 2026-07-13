import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/password_strength.dart';
import '../../domain/models/password_model.dart';
import '../../logic/providers/password_provider.dart';
import '../../../authentication/presentation/widgets/custom_button.dart';
import '../../../authentication/presentation/widgets/custom_text_field.dart';
import '../../../../core/utils/password_generator.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  final websiteController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  PasswordStrength _strength = PasswordStrength.weak;

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {
        _strength =
            PasswordStrengthChecker.check(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    websiteController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<PasswordProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              controller: websiteController,
              label: "Website",
              icon: Icons.language,
            ),

            const SizedBox(height: 20),

            CustomTextField(
              controller: usernameController,
              label: "Username",
              icon: Icons.person,
            ),

            const SizedBox(height: 20),

            CustomTextField(
              controller: passwordController,
              label: "Password",
              icon: Icons.lock,
              obscureText: true,
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Text(
                  "Password Strength: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Text(
                  _strength.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _strength == PasswordStrength.weak
                        ? Colors.red
                        : _strength == PasswordStrength.medium
                            ? Colors.orange
                            : Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

SizedBox(
  width: double.infinity,
  child: ElevatedButton.icon(
    onPressed: () {
      final generated = PasswordGenerator.generate();

      passwordController.text = generated;

      setState(() {
        _strength = PasswordStrengthChecker.check(generated);
      });
    },
    icon: const Icon(Icons.casino),
    label: const Text("Generate Strong Password"),
  ),
),

const SizedBox(height: 30),
            CustomButton(
              text: "SAVE PASSWORD",
              onPressed: () {
                provider.addPassword(
                  PasswordModel(
                    website: websiteController.text,
                    username: usernameController.text,
                    password: passwordController.text,
                  ),
                );

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}