import 'package:flutter_riverpod/flutter_riverpod.dart';

final mockApiServiceProvider = Provider<MockApiService>((ref) {
  return MockApiService();
});

class MockApiService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'success': true,
      'user': {
        'id': 'user_123',
        'name': 'Test User',
        'email': email,
        'phone': '+9779841000000',
        'role': 'passenger',
        'walletBalance': 250.0,
      },
      'token': 'mock_jwt_token',
    };
  }

  Future<List<Map<String, dynamic>>> getTransactions(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(10, (index) {
      final isCredit = index % 2 == 0;
      return {
        'id': 'trans_$index',
        'amount': isCredit ? 50.0 : -25.0,
        'type': isCredit ? 'topup' : 'fare',
        'description': isCredit ? 'Wallet Top Up' : 'Bus Fare',
        'date': '2023-06-${10 + index}',
        'status': 'completed',
      };
    });
  }

  Future<List<Map<String, dynamic>>> getRoutes() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'id': 'route_1',
        'name': 'Kirtipur - Ratnapark',
        'stops': ['Kirtipur', 'Chakrapath', 'Kalanki', 'Ratnapark'],
        'fare': 25.0,
        'duration': '45 min',
      },
      {
        'id': 'route_2',
        'name': 'New Baneshwor - Gongabu',
        'stops': ['New Baneshwor', 'Koteshwor', 'Gaushala', 'Gongabu'],
        'fare': 30.0,
        'duration': '60 min',
      },
    ];
  }

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'id': userId,
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'phone': '+9779841000000',
      'role': 'passenger',
      'walletBalance': 250.0,
      'joinedDate': '2023-01-01',
    };
  }
}
