import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../shared/components/buttons/primary_button.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/profile_placeholder.png'),
            ),
            const SizedBox(height: 16),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'john.doe@example.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text('phone'.tr()),
              subtitle: const Text('+977 9841000000'),
            ),
            ListTile(
              leading: const Icon(Icons.card_membership),
              title: Text('user_type'.tr()),
              subtitle: Text('regular_user'.tr()),
            ),
            ListTile(
              leading: const Icon(Icons.wallet),
              title: Text('wallet_balance'.tr()),
              subtitle: const Text('NPR 250.00'),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'edit_profile'.tr(),
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'change_password'.tr(),
              onPressed: () {},
              variant: ButtonVariant.outlined,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'logout'.tr(),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.login),
              variant: ButtonVariant.outlined,
            ),
          ],
        ),
      ),
    );
  }
}
