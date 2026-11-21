import 'dart:io';

import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_strings.dart';
import 'image_picker_box.dart';

class ContactPreview extends StatelessWidget {
  String name;
  String email;
  String phone;
  File? image;
  VoidCallback? onPickImage;

  ContactPreview({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagePickerBox(image: image,onTap: onPickImage,),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleMedium),
              Divider(color: AppColors.gold, height: 24),
              Text(email, style: Theme.of(context).textTheme.titleMedium),
              Divider(color: AppColors.gold, height: 24),
              Text(phone, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
