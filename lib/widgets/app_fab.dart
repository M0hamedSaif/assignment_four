import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AppFab extends StatelessWidget {
  Widget icon;
   VoidCallback? onPressed;
   Color backgroundColor;
   String? heroTag;

   AppFab({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.gold,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: icon,
    );
  }
}