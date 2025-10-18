import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FavoriteEmptyState extends StatelessWidget {
  const FavoriteEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xffFFF7ED), // orange-50
                    const Color(0xffFAF5FF), // purple-50
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 60.sp,
                color: const Color(0xffEA580C), // orange-600
              ),
            ),
            Gap(32.h),
            Text(
              'No favorites yet',
              style: AppStyles.bold20(color: AppColors.darkPurple),
              textAlign: TextAlign.center,
            ),
            Gap(12.h),
            Text(
              'Start adding cats to your favorites by tapping the heart icon on any cat image',
              style: AppStyles.regular14(color: AppColors.darkGrey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
