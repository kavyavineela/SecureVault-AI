import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/password_vault/logic/providers/password_provider.dart';
import '../features/secure_notes/logic/providers/notes_provider.dart';

class SecureVaultApp extends StatelessWidget {
  const SecureVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PasswordProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => NotesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SecureVault AI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}