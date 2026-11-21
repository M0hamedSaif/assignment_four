import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/app_colors.dart';
import '../core/app_strings.dart';
import '../core/app_validations.dart';
import '../models/contact_model.dart';
import 'contact_preview.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

Future<ContactModel?> showAddContactSheet(BuildContext context) {
  return showModalBottomSheet<ContactModel>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.darkBlue,
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) =>  AddContactSheet(),
  );
}
class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String? nameError;
  String? emailError;
  String? phoneError;
  File? image;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    setState(() => image = File(picked.path));
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContactPreview(
            image: image,
            onPickImage: pickImage,
            name: nameController.text.isEmpty
                ? AppStrings.previewName
                : nameController.text,
            email: emailController.text.isEmpty
                ? AppStrings.previewEmail
                : emailController.text,
            phone: phoneController.text.isEmpty
                ? AppStrings.previewPhone
                : phoneController.text,
          ),
          SizedBox(height: 16),
          CustomTextField(
            controller: nameController,
            hint: AppStrings.userNameHint,
            errorText: nameError,
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: 9),
          CustomTextField(
            hint: AppStrings.userEmailHint,
            controller: emailController,
            errorText: emailError,
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: 9),
          CustomTextField(
            controller: phoneController,
            hint: AppStrings.userPhoneHint,
            errorText: phoneError,
            keyboardType: TextInputType.phone,
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: 16),
          CustomButton(title: AppStrings.enterUser, onPressed: () {
            setState(() {
              nameError = AppValidators.name(nameController.text);
              emailError = AppValidators.email(emailController.text);
              phoneError = AppValidators.phone(phoneController.text);
            });

            if (nameError == null && emailError == null && phoneError == null) {

              Navigator.pop(
                context,
                ContactModel(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  phone: phoneController.text.trim(),
                  image: image
                ),
              );

            }
          }),
        ],
      ),
    );
  }
}
