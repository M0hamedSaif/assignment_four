import 'app_strings.dart';

class AppValidators {
  AppValidators._();

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredField;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredField;
    }
    final regex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
    if (!regex.hasMatch(value.trim())) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredField;
    }
    final regex = RegExp(r'^\+?\d{10,15}$');
    if (!regex.hasMatch(value.trim())) {
      return AppStrings.invalidPhone;
    }
    return null;
  }
}