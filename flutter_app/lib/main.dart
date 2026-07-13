import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/app.dart';
import 'features/password_vault/domain/models/password_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(PasswordModelAdapter());

  await Hive.openBox<PasswordModel>('passwords');

  runApp(const SecureVaultApp());
}