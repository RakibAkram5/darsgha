import '../../../core/models/user_role.dart';

enum UserStatus {
  active,
  pending,
  suspended,
  deactivated,
}

class AppUser {
  final String id;
  final String name;
  final String email;
  final String phone;
  final UserRole role;
  final String? branchId;
  final UserStatus status;
  final DateTime? lastLogin;
  final DateTime createdAt;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.branchId,
    this.status = UserStatus.pending,
    this.lastLogin,
    required this.createdAt,
  });
}
