import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PerfectMatchBanner extends StatelessWidget {
  const PerfectMatchBanner({super.key});

  static const Color _gradientStart = Color(0xffFFF7ED);
  static const Color _gradientEnd = Color(0xffFAF5FF);
  static const Color _circleGradientStart = Color(0xffEA580C);
  static const Color _circleGradientEnd = Color(0xff9333EA);
  static const Color _boxShadowColor = Color(0xffEA580C);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_gradientStart, _gradientEnd],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_circleGradientStart, _circleGradientEnd],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _boxShadowColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.star_rounded,
              color: AppColors.white,
              size: 32.sp,
            ),
          ),
          Gap(16.h),
          Text(
            'Ready to find your perfect match?',
            style: AppStyles.bold18(color: AppColors.darkPurple),
            textAlign: TextAlign.center,
          ),
          Gap(12.h),
          Text(
            'Search through hundreds of cat breeds and find the one that fits your lifestyle',
            style: AppStyles.regular14(color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),
          Gap(20.h),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [_circleGradientStart, _circleGradientEnd],
                ),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: _boxShadowColor.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  'Start Searching',
                  style: AppStyles.bold16(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
