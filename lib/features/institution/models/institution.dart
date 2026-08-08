import 'package:flutter/material.dart';

enum InstitutionType {
  school,
  academy,
  college,
  tuitionCenter,
  other,
}

class Institution {
  final String id;
  final String name;
  final InstitutionType type;
  final String? logoUrl;
  final String email;
  final String phone;
  final String? alternatePhone;
  final String? website;
  final String address;
  final String city;
  final String province;
  final String country;
  final String? postalCode;
  
  // Branding
  final Color primaryColor;
  final Color secondaryColor;

  Institution({
    required this.id,
    required this.name,
    required this.type,
    this.logoUrl,
    required this.email,
    required this.phone,
    this.alternatePhone,
    this.website,
    required this.address,
    required this.city,
    required this.province,
    required this.country,
    this.postalCode,
    this.primaryColor = const Color(0xFF4F7CFF),
    this.secondaryColor = const Color(0xFF8B5CF6),
  });

  Institution copyWith({
    String? name,
    InstitutionType? type,
    String? logoUrl,
    String? email,
    String? phone,
    String? alternatePhone,
    String? website,
    String? address,
    String? city,
    String? province,
    String? country,
    String? postalCode,
    Color? primaryColor,
    Color? secondaryColor,
  }) {
    return Institution(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      logoUrl: logoUrl ?? this.logoUrl,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      alternatePhone: alternatePhone ?? this.alternatePhone,
      website: website ?? this.website,
      address: address ?? this.address,
      city: city ?? this.city,
      province: province ?? this.province,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }
}
