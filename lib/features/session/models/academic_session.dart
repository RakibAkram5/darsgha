enum SessionStatus { upcoming, active, closed, archived }

class AcademicSession {
  final String id;
  final String institutionId;
  final String year;
  final DateTime startDate;
  final DateTime endDate;
  final SessionStatus status;

  AcademicSession({
    required this.id,
    required this.institutionId,
    required this.year,
    required this.startDate,
    required this.endDate,
    this.status = SessionStatus.upcoming,
  });
}
