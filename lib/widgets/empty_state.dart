import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/app_assets.dart';
import '../core/app_strings.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(AppAssets.emptyListAnimation, width: 220),
          SizedBox(height: 24),
          Text(
            AppStrings.noContacts,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
