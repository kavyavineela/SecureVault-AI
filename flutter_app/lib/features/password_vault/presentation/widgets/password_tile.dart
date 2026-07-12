import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTile extends StatefulWidget {
  final String website;
  final String username;
  final String password;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const PasswordTile({
    super.key,
    required this.website,
    required this.username,
    required this.password,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<PasswordTile> createState() => _PasswordTileState();
}

class _PasswordTileState extends State<PasswordTile> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.website,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(widget.username),

            const SizedBox(height: 8),

            Text(
              isHidden ? "••••••••••" : widget.password,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 10),

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
                        content: Text("Password copied"),
                      ),
                    );
                  },
                ),

                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.orange,
                  ),
                  onPressed: widget.onEdit,
                ),

                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: widget.onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}