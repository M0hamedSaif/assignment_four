import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? errorText;
  ValueChanged<String>? onChanged;

  CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.gold,
      ),
      decoration: InputDecoration(hintText: hint,errorText: errorText),
    );
  }
}
