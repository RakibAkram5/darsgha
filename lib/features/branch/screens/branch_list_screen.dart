import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/services/mock_data_service.dart';
import '../models/branch.dart';

class BranchListScreen extends StatelessWidget {
  const BranchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final branches = MockDataService.branches;

    return Scaffold(
      appBar: AppBar(title: const Text('Branches')),
      body: branches.isEmpty
          ? _buildEmptyState(context)
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: branches.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final branch = branches[index];
                return _buildBranchCard(context, branch);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.electricBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildBranchCard(BuildContext context, Branch branch) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                branch.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              _buildStatusBadge(branch.status),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            branch.code,
            style: TextStyle(
              color: AppColors.cyberCyan,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildInfoRow(Icons.location_on_outlined, branch.address),
          const SizedBox(height: AppSpacing.sm),
          _buildInfoRow(Icons.phone_outlined, branch.phone),
          const SizedBox(height: AppSpacing.sm),
          _buildInfoRow(Icons.email_outlined, branch.email),
          const Divider(height: AppSpacing.lg, color: Colors.white10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Edit')),
              const SizedBox(width: AppSpacing.sm),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkElevated,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Manage'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BranchStatus status) {
    Color color;
    switch (status) {
      case BranchStatus.active:
        color = Colors.greenAccent;
        break;
      case BranchStatus.inactive:
        color = Colors.orangeAccent;
        break;
      case BranchStatus.archived:
        color = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: AppRadius.radiusSm,
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.darkTextSecondary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off_outlined,
            size: 80,
            color: AppColors.darkElevated,
          ),
          const SizedBox(height: AppSpacing.md),
          const Text(
            'No branches added yet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Add your first branch to organize multiple campuses.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.darkTextSecondary),
          ),
          const SizedBox(height: AppSpacing.lg),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.electricBlue,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Add Branch'),
          ),
        ],
      ),
    );
  }
}
