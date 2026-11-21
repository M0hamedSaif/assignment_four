import 'package:flutter/material.dart';
import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../core/app_icons.dart';
import '../core/app_strings.dart';
import '../models/contact_model.dart';
import 'custom_button.dart';
import 'info_row.dart';

class ContactCard extends StatelessWidget {
   ContactModel contact;
   VoidCallback? onDelete;

   ContactCard({super.key, required this.contact, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppColors.gold,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  contact.image == null
                      ? const ColoredBox(
                    color: AppColors.darkBlue,
                    child: Icon(AppIcons.person,
                        size: 48, color: AppColors.gold),
                  )
                      : Image.file(contact.image!, fit: BoxFit.cover,),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        contact.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.darkBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  InfoRow(icon: AppIcons.email, text: contact.email),
                  const SizedBox(height: 6),
                  InfoRow(icon: AppIcons.phone, text: contact.phone),
                  const SizedBox(height: 8),
                  CustomButton(
                    title: AppStrings.delete,
                    icon:Image.asset(
                      AppAssets.trashIcon,
                      width: 12,
                      color: AppColors.white,
                    ),
                    onPressed: onDelete,
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}