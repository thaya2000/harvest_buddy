import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText; // Added for password visibility control

  const InputText({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false, // Default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText, // Set to true for password fields
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
