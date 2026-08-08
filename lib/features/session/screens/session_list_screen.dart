import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/services/mock_data_service.dart';
import '../models/academic_session.dart';

class SessionListScreen extends StatelessWidget {
  const SessionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessions = MockDataService.sessions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Sessions'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: sessions.length,
        separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          final session = sessions[index];
          return _buildSessionCard(context, session);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.electricBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSessionCard(BuildContext context, AcademicSession session) {
    final dateFormat = DateFormat('dd-MMM-yyyy');
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.radiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                session.year,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              _buildStatusBadge(session.status),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _buildDateColumn('Start Date', dateFormat.format(session.startDate)),
              const Spacer(),
              const Icon(Icons.arrow_forward, size: 16, color: Colors.white24),
              const Spacer(),
              _buildDateColumn('End Date', dateFormat.format(session.endDate)),
            ],
          ),
          const Divider(height: AppSpacing.lg, color: Colors.white10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (session.status != SessionStatus.active)
                TextButton(
                  onPressed: () {},
                  child: const Text('Activate'),
                ),
              TextButton(
                onPressed: () {},
                child: const Text('Edit'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateColumn(String label, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(SessionStatus status) {
    Color color;
    switch (status) {
      case SessionStatus.active:
        color = AppColors.cyberCyan;
        break;
      case SessionStatus.upcoming:
        color = Colors.blueAccent;
        break;
      case SessionStatus.closed:
        color = Colors.orangeAccent;
        break;
      case SessionStatus.archived:
        color = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.radiusMd,
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
