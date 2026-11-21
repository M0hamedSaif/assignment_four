import 'package:flutter/material.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../core/app_icons.dart';
import '../models/contact_model.dart';
import '../widgets/add_contact_sheet.dart';
import '../widgets/app_fab.dart';
import '../widgets/contact_card.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int maxContacts = 6;
  List<ContactModel> contacts = [];
  void deleteContact(int index) {
    setState(() => contacts.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.logo, height: 40)),
      body: Padding(
        padding: EdgeInsets.all(16),

        child: contacts.isEmpty
            ? EmptyState()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.60,
                ),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ContactCard(contact: contacts[index], onDelete: ()=>deleteContact(index));
                },
              ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contacts.isNotEmpty) ...[
            AppFab(
              heroTag: 'delete',
              icon: Image.asset(
                AppAssets.trashIcon,
                width: 24,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.red,
              onPressed: () => deleteContact(contacts.length - 1),
            ),
            const SizedBox(height: 12),
          ],
          if (contacts.length < maxContacts)
            AppFab(
              heroTag: 'add',
              icon: Icon(AppIcons.add, size: 28, color: AppColors.darkBlue),
              onPressed: () async {
                final contact = await showAddContactSheet(context);
                if (contact == null || !mounted) return;
                setState(() => contacts.add(contact));
              },
            ),
        ],
      ),
    );
  }
}
