import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GalleryAppBar extends StatelessWidget {
  const GalleryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gallery',
                  style: AppStyles.bold24(color: AppColors.darkPurple),
                ),
                Gap(4.h),
                Text(
                  '9 adorable cats',
                  style: AppStyles.regular14(color: AppColors.darkGrey),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Implement refresh functionality
            },
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xffF3F4F6), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.refresh_rounded,
                size: 24.sp,
                color: AppColors.darkPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
