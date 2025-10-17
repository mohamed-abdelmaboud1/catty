import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  // Define color constants
  static const Color _gradientStart = Color(0xffFFF7ED);
  static const Color _gradientEnd = Color(0xffFAF5FF);
  static const Color _borderColor = Color(0xffFED7AA);
  static const Color _iconColor = Color(0xffEA580C);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_gradientStart, _gradientEnd],
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: _borderColor.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.pets,
              color: _iconColor,
              size: 20.sp,
            ),
          ),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Welcome to Cat Explorer! 🐱',
                        style: AppStyles.bold16(color: AppColors.darkPurple),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Close banner
                      },
                      child: Icon(
                        Icons.close,
                        size: 18.sp,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                Text(
                  'Discover amazing cat breeds, save your favorites, and learn everything about these adorable companions.',
                  style: AppStyles.regular14(color: AppColors.darkGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
