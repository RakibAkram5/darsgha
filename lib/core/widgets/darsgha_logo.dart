import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DarsghaLogo extends StatelessWidget {
  final double size;
  final bool showText;
  final Color? color;

  const DarsghaLogo({
    super.key,
    this.size = 100,
    this.showText = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: color == null ? AppColors.brandGradient : null,
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              if (color == null)
                BoxShadow(
                  color: AppColors.electricBlue.withOpacity(0.3),
                  blurRadius: size / 4,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.school_rounded, // Symbolizing "Education + Technology"
              size: size * 0.6,
              color: Colors.white,
            ),
          ),
        ),
        if (showText) ...[
          SizedBox(height: size / 8),
          Text(
            'Darsgha',
            style: TextStyle(
              fontSize: size / 3,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: color ?? (Theme.of(context).brightness == Brightness.dark 
                ? AppColors.darkTextPrimary 
                : AppColors.lightTextPrimary),
            ),
          ),
        ],
      ],
    );
  }
}
