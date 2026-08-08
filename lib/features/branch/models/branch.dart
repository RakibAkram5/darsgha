enum BranchStatus { active, inactive, archived }

class Branch {
  final String id;
  final String institutionId;
  final String name;
  final String code;
  final String phone;
  final String email;
  final String address;
  final String city;
  final String province;
  final String? managerId;
  final BranchStatus status;

  Branch({
    required this.id,
    required this.institutionId,
    required this.name,
    required this.code,
    required this.phone,
    required this.email,
    required this.address,
    required this.city,
    required this.province,
    this.managerId,
    this.status = BranchStatus.active,
  });
}
