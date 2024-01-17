import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final controller;
  final String labelText;

  const InputText({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
      child: TextFormField(
        controller: controller,
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
