import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes.dart';

class LanguageSelectScreen extends ConsumerStatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  ConsumerState<LanguageSelectScreen> createState() =>
      _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends ConsumerState<LanguageSelectScreen> {
  Locale? _selectedLocale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/yugo_logo.png', width: 150),
            const SizedBox(height: 40),
            Text(
              'Welcome to Yugo!'.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Please select your preferred language to continue.\nकृपया जारी राख्नको लागि आफ्नो भाषा चयन गर्नुहोस्।',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    await context.setLocale(const Locale('en'));
                    // Add a short delay to ensure locale is applied before navigation
                    await Future.delayed(const Duration(milliseconds: 200));
                    if (mounted) {
                      context.go(AppRoutes.login);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    'English',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () async {
                    await context.setLocale(const Locale('ne'));
                    await Future.delayed(const Duration(milliseconds: 200));
                    if (mounted) {
                      context.go(AppRoutes.login);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    'नेपाली',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () async {
                await context.setLocale(const Locale('en'));
                if (mounted) {
                  context.go(AppRoutes.login);
                }
              },
              child: Text(
                'Skip / छोड्नुहोस्',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
