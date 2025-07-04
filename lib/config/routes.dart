import 'package:flutter_riverpod/flutter_riverpod.dart'; // Add this import
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/language_selection_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/signup_screen.dart';
import '../features/common/profile/presentation/profile_screen.dart';
import '../features/common/settings/presentation/settings_screen.dart';
import '../features/conductor/dashboard/presentation/conductor_home.dart';
import '../features/conductor/scanner/presentation/qr_scanner_screen.dart';
import '../features/passenger/dashboard/presentation/passenger_home.dart';
import '../features/passenger/routes/presentation/routes_screen.dart';
import '../features/passenger/trips/presentation/trips_screen.dart';
import '../features/passenger/wallet/presentation/wallet_screen.dart';

// Define your route names as constants
class AppRoutes {
  static const String languageSelect = '/language-select';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String passengerHome = '/passenger/home';
  static const String wallet = 'wallet';
  static const String profile = 'profile';
  static const String settings = 'settings';
  static const String scanner = 'scanner';
  static const String conductorHome = '/conductor/home';
  static const String tripHistory = '/trips';
  static const String routeList = '/routes';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.languageSelect,
    routes: [
      GoRoute(
        path: AppRoutes.languageSelect,
        name: 'language-select',
        builder: (context, state) => const LanguageSelectScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.tripHistory,
        name: 'trips',
        builder: (context, state) => const TripsScreen(),
      ),
      GoRoute(
        path: AppRoutes.routeList,
        name: 'routes',
        builder: (context, state) => const RoutesScreen(),
      ),
      GoRoute(
        path: AppRoutes.passengerHome,
        name: 'passenger-home',
        builder: (context, state) => const PassengerHome(),
        routes: [
          GoRoute(
            path: AppRoutes.wallet,
            name: 'wallet',
            builder: (context, state) => const WalletScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
      GoRoute(
          path: AppRoutes.conductorHome,
          name: 'conductor-home',
          builder: (context, state) => const ConductorHome(),
          routes: [
            GoRoute(
              path: AppRoutes.scanner,
              name: 'scanner',
              builder: (context, state) => const QrScannerScreen(),
            ),
          ]),
    ],
  );
});
