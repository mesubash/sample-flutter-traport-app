import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/routes.dart';
import '../config/themes.dart';

class YugoApp extends ConsumerWidget {
  const YugoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Yugo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme(context),
      darkTheme: AppThemes.darkTheme(context),
      themeMode: ThemeMode.system,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: EasyLocalization(
            child: child!,
            supportedLocales: const [Locale('en'), Locale('ne')],
            path: 'assets/translations',
            fallbackLocale: const Locale('en'),
          ),
        );
      },
    );
  }
}
