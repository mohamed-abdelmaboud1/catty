import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTapWidget extends StatelessWidget {
  const CustomTapWidget({
    super.key,
    required this.data,
    required this.isActive,
    this.onTap,
  });

  final String data;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isActive ? AppColors.primary : AppColors.primaryShade,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: TextStyle(
            color: isActive ? AppColors.primaryShade : AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
