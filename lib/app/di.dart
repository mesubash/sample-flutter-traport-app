import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugomobile/shared/services/api/mock_api_service.dart';

// Provider for the entire app's dependency injection
final appDependenciesProvider = Provider<AppDependencies>((ref) {
  return AppDependencies(
    apiService: ref.watch(mockApiServiceProvider),
  );
});

class AppDependencies {
  final MockApiService apiService;

  AppDependencies({
    required this.apiService,
  });
}

Future<void> configureDependencies() async {
  // Initialize any async dependencies here
  // For example: Hive boxes, Firebase, etc.
}
