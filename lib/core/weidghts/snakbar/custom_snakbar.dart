import 'package:flutter/material.dart';

class CustomSnakbar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
