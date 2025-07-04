import 'package:hive/hive.dart';

part 'user_model.g.dart'; // This will be generated

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? phone;

  @HiveField(4)
  final String role;

  @HiveField(5)
  final double walletBalance;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.role,
    required this.walletBalance,
  });

  // Add copyWith method for immutability
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? role,
    double? walletBalance,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      walletBalance: walletBalance ?? this.walletBalance,
    );
  }
}
