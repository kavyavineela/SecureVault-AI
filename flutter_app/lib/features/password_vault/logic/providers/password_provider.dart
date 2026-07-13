import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/models/password_model.dart';

class PasswordProvider extends ChangeNotifier {
  final Box<PasswordModel> _passwordBox =
      Hive.box<PasswordModel>('passwords');

  List<PasswordModel> get passwords => _passwordBox.values.toList();

  String _searchQuery = "";

  List<PasswordModel> get filteredPasswords {
    if (_searchQuery.isEmpty) {
      return passwords;
    }

    return passwords.where((password) {
      return password.website
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  Future<void> addPassword(PasswordModel password) async {
    await _passwordBox.add(password);
    notifyListeners();
  }

  Future<void> deletePassword(int index) async {
    await _passwordBox.deleteAt(index);
    notifyListeners();
  }

  Future<void> updatePassword(
      int index,
      PasswordModel password,
      ) async {
    await _passwordBox.putAt(index, password);
    notifyListeners();
  }
}