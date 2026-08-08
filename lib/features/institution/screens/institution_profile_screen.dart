import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/services/mock_data_service.dart';
import '../models/institution.dart';

class InstitutionProfileScreen extends StatefulWidget {
  const InstitutionProfileScreen({super.key});

  @override
  State<InstitutionProfileScreen> createState() =>
      _InstitutionProfileScreenState();
}

class _InstitutionProfileScreenState extends State<InstitutionProfileScreen> {
  late Institution _institution;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _institution = MockDataService.currentInstitution;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institution Profile'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
              if (!_isEditing) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile updated successfully')),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            _buildLogoSection(),
            const SizedBox(height: AppSpacing.lg),
            _buildInfoSection(),
            const SizedBox(height: AppSpacing.lg),
            _buildAddressSection(),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.darkElevated,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.electricBlue, width: 2),
            ),
            child: const Icon(
              Icons.school,
              size: 60,
              color: AppColors.electricBlue,
            ),
          ),
          if (_isEditing)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.electricBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return _buildCard(
      title: 'Basic Information',
      children: [
        _buildTextField(
          label: 'Institution Name',
          initialValue: _institution.name,
          enabled: _isEditing,
        ),
        const SizedBox(height: AppSpacing.md),
        _buildDropdownField(
          label: 'Institution Type',
          value: _institution.type.name,
          items: InstitutionType.values.map((e) => e.name).toList(),
          enabled: _isEditing,
        ),
        const SizedBox(height: AppSpacing.md),
        _buildTextField(
          label: 'Email',
          initialValue: _institution.email,
          enabled: _isEditing,
        ),
        const SizedBox(height: AppSpacing.md),
        _buildTextField(
          label: 'Phone',
          initialValue: _institution.phone,
          enabled: _isEditing,
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return _buildCard(
      title: 'Location & Address',
      children: [
        _buildTextField(
          label: 'Address',
          initialValue: _institution.address,
          enabled: _isEditing,
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                label: 'City',
                initialValue: _institution.city,
                enabled: _isEditing,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildTextField(
                label: 'Province',
                initialValue: _institution.province,
                enabled: _isEditing,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _buildTextField(
          label: 'Country',
          initialValue: _institution.country,
          enabled: _isEditing,
        ),
      ],
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.radiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: AppSpacing.md),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    bool enabled = false,
  }) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.darkTextSecondary),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkElevated),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.electricBlue),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    bool enabled = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12),
        ),
        DropdownButton<String>(
          value: value,
          isExpanded: true,
          underline: Container(
            height: 1,
            color: enabled
                ? AppColors.darkElevated
                : Colors.white.withValues(alpha: 0.1),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: enabled ? (val) {} : null,
        ),
      ],
    );
  }
}
