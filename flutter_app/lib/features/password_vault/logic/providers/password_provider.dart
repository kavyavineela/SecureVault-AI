import 'package:flutter/material.dart';
import '../../domain/models/password_model.dart';

class PasswordProvider extends ChangeNotifier {
  final List<PasswordModel> _passwords = [];

  List<PasswordModel> get passwords => _passwords;

  void addPassword(PasswordModel password) {
    _passwords.add(password);
    notifyListeners();
  }
}