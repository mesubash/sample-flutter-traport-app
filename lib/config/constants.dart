class AppConstants {
  static const String appName = 'Yugo';
  static const double padding = 16.0;
  static const double borderRadius = 12.0;

  // Mock API endpoints
  static const String mockApiBaseUrl = 'https://mock-api.yugo.com/v1';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String walletBalanceEndpoint = '/wallet/balance';
  static const String startTripEndpoint = '/trips/start';
  static const String endTripEndpoint = '/trips/end';
  static const String routesEndpoint = '/routes';
}

class AppRoutes {
  static const String splash = '/';
  static const String languageSelect = '/language-select';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String passengerHome = '/passenger/home';
  static const String conductorHome = '/conductor/home';
  static const String wallet = '/wallet';
  static const String tripHistory = '/trips';
  static const String routeList = '/routes';
  static const String profile = '/profile';
  static const String settings = '/settings';
}
