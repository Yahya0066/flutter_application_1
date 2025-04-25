import 'package:flutter/material.dart';

extension FormKeyExtintion on GlobalKey<FormState> {
  bool isValid() {
    return currentState?.validate() ?? false;
  }
}
