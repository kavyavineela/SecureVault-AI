import 'package:flutter/material.dart';
import '../../domain/models/password_model.dart';

class PasswordProvider extends ChangeNotifier {
  final List<PasswordModel> _passwords = [];

  List<PasswordModel> get passwords => _passwords;

  void addPassword(PasswordModel password) {
    _passwords.add(password);
    notifyListeners();
  }

  void deletePassword(int index) {
    _passwords.removeAt(index);
    notifyListeners();
  }

  void updatePassword(int index, PasswordModel updatedPassword) {
    _passwords[index] = updatedPassword;
    notifyListeners();
  }
}