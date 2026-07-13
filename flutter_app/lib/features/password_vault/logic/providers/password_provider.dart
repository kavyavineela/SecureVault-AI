import 'package:flutter/material.dart';
import '../../domain/models/password_model.dart';

class PasswordProvider extends ChangeNotifier {
  final List<PasswordModel> _passwords = [];

  String _searchQuery = "";

  List<PasswordModel> get passwords {
    if (_searchQuery.isEmpty) {
      return _passwords;
    }

    return _passwords.where((password) {
      return password.website
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

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