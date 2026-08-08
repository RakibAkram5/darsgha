# Institution Management (Phase 2)

This document outlines the Institution Management and SaaS Administration features implemented in Phase 2.

## 1. Overview
Phase 2 provides the foundation for Institution Owners to manage their schools or academies. This includes managing multiple branches, academic sessions, departments, and administrative staff.

## 2. Core Modules

### Institution Profile
- Managed via `InstitutionProfileScreen`.
- Fields: Name, Type (School/Academy), Contact Info, Address, Branding.
- Supports logo reference and institution-specific colors.

### Branch Management
- Managed via `BranchListScreen`.
- Supports multi-campus architecture.
- Fields: Branch Name, Code, Phone, Email, Address, Status (Active/Inactive/Archived).

### Academic Sessions
- Managed via `SessionListScreen`.
- Foundation for all academic records.
- Fields: Academic Year, Start/End Dates, Status (Upcoming/Active/Closed/Archived).

### User Management
- Managed via `UserListScreen`.
- Supports inviting staff with specific roles:
  - Academic Coordinator
  - HR
  - Accountant
  - Teacher

## 3. Architecture
- **Tenant Isolation**: All data is scoped to the `institutionId`.
- **Role-Based Access Control (RBAC)**: Enforced via the Phase 1 permissions system.
- **Models**: Located in `lib/features/{feature}/models/`.
- **UI**: Premium, futuristic dark theme consistent with Darsgha branding.

## 4. Setup Progress
The Owner Dashboard includes a setup progress indicator to guide owners through the initial configuration:
1. Profile Completion
2. Logo Upload
3. Academic Session Creation
4. Branch Configuration
5. Department Setup
6. Staff Invitation
