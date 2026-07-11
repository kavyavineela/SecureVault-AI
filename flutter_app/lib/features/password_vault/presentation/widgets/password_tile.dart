import 'package:flutter/material.dart';

class PasswordTile extends StatelessWidget {
  final String website;
  final String username;

  const PasswordTile({
    super.key,
    required this.website,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.lock),
        title: Text(website),
        subtitle: Text(username),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}