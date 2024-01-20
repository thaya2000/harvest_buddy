import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String? text;
  final String labelText;
  final bool obscureText; // Added for password visibility control
  final ValueChanged<String>? onChanged; // New parameter for onChanged

  const InputText({
    Key? key,
    required this.text,
    required this.labelText,
    this.obscureText = false, // Default to false
    this.onChanged, // Added onChanged parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
      child: TextFormField(
        initialValue: text,
        obscureText: obscureText, // Set to true for password fields
        onChanged: onChanged, // Pass the onChanged callback
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15.0), // Adjust these values as needed
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
