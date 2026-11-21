import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class InfoRow extends StatelessWidget {
   IconData icon;
   String text;

   InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:  EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 12, color: AppColors.gold),
        ),
         SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.darkBlue,fontWeight: FontWeight.w500,height: 1),
          ),
        ),
      ],
    );
  }
}