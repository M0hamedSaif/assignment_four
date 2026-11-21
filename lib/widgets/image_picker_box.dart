import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../core/app_assets.dart';
import '../core/app_colors.dart';

class ImagePickerBox extends StatelessWidget {
   VoidCallback? onTap;
    File? image;

   ImagePickerBox({super.key,this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.gold),
        ),
        child: image ==null
          ?Padding(
          padding: const EdgeInsets.all(12),
          child: Lottie.asset(AppAssets.imagePickerAnimation),
        )
            : Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}