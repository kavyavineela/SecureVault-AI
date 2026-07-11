import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTile extends StatefulWidget {
  final String website;
  final String username;
  final String password;

  const PasswordTile({
    super.key,
    required this.website,
    required this.username,
    required this.password,
  });

  @override
  State<PasswordTile> createState() => _PasswordTileState();
}

class _PasswordTileState extends State<PasswordTile> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                const Icon(Icons.lock, color: Colors.blue),
                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    widget.website,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              widget.username,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              isHidden
                  ? "••••••••••"
                  : widget.password,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 2,
              ),
            ),

            Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [

    IconButton(
      icon: Icon(
        isHidden
            ? Icons.visibility
            : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
          isHidden = !isHidden;
        });
      },
    ),

    IconButton(
      icon: const Icon(Icons.copy),
      onPressed: () {
        Clipboard.setData(
          ClipboardData(text: widget.password),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password copied!"),
          ),
        );
      },
    ),

  ],
),
          ],
        ),
      ),
    );
  }
}