import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StatsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const StatsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24.sp),
          Gap(8.h),
          Text(
            label,
            style: AppStyles.regular12(color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),
          Gap(4.h),
          Text(
            value,
            style: AppStyles.bold18(color: AppColors.darkPurple),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
