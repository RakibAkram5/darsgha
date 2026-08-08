import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/services/mock_data_service.dart';
import '../../../core/models/user_role.dart';
import '../models/app_user.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = MockDataService.users;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchField(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: users.length,
              separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final user = users[index];
                return _buildUserTile(user);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.electricBlue,
        icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
        label: const Text('Invite Staff', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by name, email or phone...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: AppColors.darkCard,
          border: OutlineInputBorder(
            borderRadius: AppRadius.radiusMd,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildUserTile(AppUser user) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.radiusMd,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.darkElevated,
          child: Text(
            user.name[0].toUpperCase(),
            style: const TextStyle(color: AppColors.electricBlue, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.role.displayName, style: const TextStyle(color: AppColors.cyberCyan, fontSize: 12)),
            Text(user.email, style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: _buildStatusIndicator(user.status),
        isThreeLine: true,
        onTap: () {},
      ),
    );
  }

  Widget _buildStatusIndicator(UserStatus status) {
    Color color;
    switch (status) {
      case UserStatus.active:
        color = Colors.greenAccent;
        break;
      case UserStatus.pending:
        color = Colors.orangeAccent;
        break;
      case UserStatus.suspended:
        color = Colors.redAccent;
        break;
      case UserStatus.deactivated:
        color = Colors.grey;
        break;
    }

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.5), blurRadius: 4),
        ],
      ),
    );
  }
}
