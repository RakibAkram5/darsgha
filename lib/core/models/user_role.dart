enum UserRole {
  owner,
  academicCoordinator,
  hr,
  accountant,
  teacher,
  student,
  parent,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.owner:
        return 'Owner';
      case UserRole.academicCoordinator:
        return 'Academic Coordinator';
      case UserRole.hr:
        return 'HR';
      case UserRole.accountant:
        return 'Accountant';
      case UserRole.teacher:
        return 'Teacher';
      case UserRole.student:
        return 'Student';
      case UserRole.parent:
        return 'Parent';
    }
  }
}
