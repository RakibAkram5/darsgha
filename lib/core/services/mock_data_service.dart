import '../models/user_role.dart';
import '../../features/institution/models/institution.dart';
import '../../features/branch/models/branch.dart';
import '../../features/session/models/academic_session.dart';
import '../../features/department/models/department.dart';
import '../../features/users/models/app_user.dart';

class MockDataService {
  static final Institution currentInstitution = Institution(
    id: 'inst_1',
    name: 'Darsgha Academy',
    type: InstitutionType.academy,
    email: 'info@darsgha.edu',
    phone: '+92 300 1234567',
    address: 'Johar Town',
    city: 'Lahore',
    province: 'Punjab',
    country: 'Pakistan',
  );

  static final List<Branch> branches = [
    Branch(
      id: 'br_1',
      institutionId: 'inst_1',
      name: 'Main Campus',
      code: 'MC-01',
      phone: '+92 42 35123456',
      email: 'main@darsgha.edu',
      address: 'Block R1, Johar Town',
      city: 'Lahore',
      province: 'Punjab',
    ),
    Branch(
      id: 'br_2',
      institutionId: 'inst_1',
      name: 'Gulberg Campus',
      code: 'GC-02',
      phone: '+92 42 35712345',
      email: 'gulberg@darsgha.edu',
      address: 'Main Boulevard, Gulberg III',
      city: 'Lahore',
      province: 'Punjab',
    ),
  ];

  static final List<AcademicSession> sessions = [
    AcademicSession(
      id: 'sess_1',
      institutionId: 'inst_1',
      year: '2026-2027',
      startDate: DateTime(2026, 8, 1),
      endDate: DateTime(2027, 7, 31),
      status: SessionStatus.active,
    ),
  ];

  static final List<Department> departments = [
    Department(id: 'dept_1', institutionId: 'inst_1', name: 'Administration'),
    Department(id: 'dept_2', institutionId: 'inst_1', name: 'Academics'),
    Department(id: 'dept_3', institutionId: 'inst_1', name: 'Science'),
  ];

  static final List<AppUser> users = [
    AppUser(
      id: 'user_1',
      name: 'Ahmed Ali',
      email: 'ahmed@darsgha.edu',
      phone: '03001112223',
      role: UserRole.owner,
      status: UserStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    AppUser(
      id: 'user_2',
      name: 'Sara Khan',
      email: 'sara@darsgha.edu',
      phone: '03004445556',
      role: UserRole.teacher,
      branchId: 'br_1',
      status: UserStatus.active,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
  ];
}
