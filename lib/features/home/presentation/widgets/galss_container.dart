import 'package:catty/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalssContainer extends StatelessWidget {
  const GalssContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: child,
    );
  }
}
