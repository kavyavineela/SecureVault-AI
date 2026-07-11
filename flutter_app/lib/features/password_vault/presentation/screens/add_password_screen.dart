
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/password_model.dart';
import '../../logic/providers/password_provider.dart';
import '../../../authentication/presentation/widgets/custom_button.dart';
import '../../../authentication/presentation/widgets/custom_text_field.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {

  final websiteController = TextEditingController();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    websiteController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<PasswordProvider>(context, listen: false);

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