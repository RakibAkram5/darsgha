class Department {
  final String id;
  final String institutionId;
  final String? branchId;
  final String name;
  final String? headId;
  final bool isActive;

  Department({
    required this.id,
    required this.institutionId,
    this.branchId,
    required this.name,
    this.headId,
    this.isActive = true,
  });
}
