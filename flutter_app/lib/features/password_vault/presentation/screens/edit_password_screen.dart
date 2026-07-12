import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/password_model.dart';
import '../../logic/providers/password_provider.dart';
import '../../../authentication/presentation/widgets/custom_button.dart';
import '../../../authentication/presentation/widgets/custom_text_field.dart';

class EditPasswordScreen extends StatefulWidget {
  final int index;
  final PasswordModel password;

  const EditPasswordScreen({
    super.key,
    required this.index,
    required this.password,
  });

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  late TextEditingController websiteController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    websiteController =
        TextEditingController(text: widget.password.website);

    usernameController =
        TextEditingController(text: widget.password.username);

    passwordController =
        TextEditingController(text: widget.password.password);
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
        title: const Text("Edit Password"),
        centerTitle: true,
      ),
      body: Padding(
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

            const SizedBox(height: 40),

            CustomButton(
              text: "UPDATE PASSWORD",
              onPressed: () {
                provider.updatePassword(
                  widget.index,
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