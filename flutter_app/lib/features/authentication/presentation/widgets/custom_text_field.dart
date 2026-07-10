import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isHidden;

  @override
  void initState() {
    super.initState();
    _isHidden = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isHidden,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),

        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isHidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
              )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}