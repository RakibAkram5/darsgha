import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/services/mock_data_service.dart';
import '../../../core/widgets/darsgha_logo.dart';
import '../../institution/screens/institution_profile_screen.dart';
import '../../branch/screens/branch_list_screen.dart';
import '../../session/screens/session_list_screen.dart';
import '../../users/screens/user_list_screen.dart';

class OwnerDashboard extends StatelessWidget {
  const OwnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final institution = MockDataService.currentInstitution;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, institution.name),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreeting(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildSetupProgress(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildStatsGrid(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildSectionHeader('Quick Actions'),
                  const SizedBox(height: AppSpacing.md),
                  _buildQuickActions(context),
                  const SizedBox(height: AppSpacing.lg),
                  _buildSectionHeader('Institution Overview'),
                  const SizedBox(height: AppSpacing.md),
                  _buildOverviewCard(context),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, String institutionName) {
    return SliverAppBar(
      expandedHeight: 120.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          institutionName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        background: Container(
          decoration: const BoxDecoration(gradient: AppColors.brandGradient),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Icon(
                  Icons.school_outlined,
                  size: 150,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Good Morning, Ahmed 👋',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Manage your institution efficiency today.',
          style: TextStyle(color: AppColors.darkTextSecondary),
        ),
      ],
    );
  }

  Widget _buildSetupProgress() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(
          color: AppColors.electricBlue.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Institution Setup',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '75%',
                style: TextStyle(
                  color: AppColors.cyberCyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: AppRadius.radiusXs,
            child: LinearProgressIndicator(
              value: 0.75,
              minHeight: 8,
              backgroundColor: AppColors.darkElevated,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.cyberCyan,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _SetupChip(label: 'Profile', isDone: true),
              _SetupChip(label: 'Logo', isDone: true),
              _SetupChip(label: 'Session', isDone: true),
              _SetupChip(label: 'Branch', isDone: true),
              _SetupChip(label: 'Departments', isDone: true),
              _SetupChip(label: 'Staff', isDone: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppSpacing.md,
      mainAxisSpacing: AppSpacing.md,
      childAspectRatio: 1.5,
      children: [
        _StatCard(
          title: 'Status',
          value: 'Active',
          icon: Icons.check_circle_outline,
          color: Colors.greenAccent,
        ),
        _StatCard(
          title: 'Session',
          value: '26–27',
          icon: Icons.calendar_today_outlined,
          color: AppColors.electricBlue,
        ),
        _StatCard(
          title: 'Branches',
          value: '2',
          icon: Icons.location_city_outlined,
          color: AppColors.auroraViolet,
        ),
        _StatCard(
          title: 'Staff',
          value: '12',
          icon: Icons.people_outline,
          color: AppColors.cyberCyan,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _QuickActionItem(
            icon: Icons.edit_note,
            label: 'Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstitutionProfileScreen(),
                ),
              );
            },
          ),
          _QuickActionItem(
            icon: Icons.add_location_alt_outlined,
            label: 'Branches',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BranchListScreen(),
                ),
              );
            },
          ),
          _QuickActionItem(
            icon: Icons.event_note_outlined,
            label: 'Sessions',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SessionListScreen(),
                ),
              );
            },
          ),
          _QuickActionItem(
            icon: Icons.person_add_alt_1_outlined,
            label: 'Staff',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserListScreen()),
              );
            },
          ),
          _QuickActionItem(
            icon: Icons.settings_outlined,
            label: 'Settings',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.radiusLg,
      ),
      child: Column(
        children: [
          ListTile(
            leading: const DarsghaLogo(size: 40, showText: false),
            title: const Text('Darsgha Academy'),
            subtitle: const Text('Lahore, Punjab'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
              onPressed: () {},
            ),
          ),
          const Divider(color: Colors.white10),
          const ListTile(
            leading: Icon(Icons.email_outlined, size: 20),
            title: Text('info@darsgha.edu', style: TextStyle(fontSize: 14)),
          ),
          const ListTile(
            leading: Icon(Icons.phone_outlined, size: 20),
            title: Text('+92 300 1234567', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class _SetupChip extends StatelessWidget {
  final String label;
  final bool isDone;

  const _SetupChip({required this.label, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isDone
            ? AppColors.cyberCyan.withValues(alpha: 0.1)
            : AppColors.darkElevated,
        borderRadius: AppRadius.radiusSm,
        border: Border.all(
          color: isDone
              ? AppColors.cyberCyan.withValues(alpha: 0.3)
              : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 14,
            color: isDone ? AppColors.cyberCyan : AppColors.darkTextSecondary,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isDone ? AppColors.cyberCyan : AppColors.darkTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.radiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: AppColors.darkTextSecondary),
          ),
        ],
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: AppSpacing.md),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.darkElevated,
                borderRadius: AppRadius.radiusMd,
              ),
              child: Icon(icon, color: AppColors.electricBlue),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
