import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GallerySearchBar extends StatelessWidget {
  final TextEditingController controller;

  const GallerySearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xffE5E7EB), width: 1),
      ),
      child: TextField(
        controller: controller,
        style: AppStyles.regular16(color: AppColors.darkPurple),
        decoration: InputDecoration(
          hintText: 'Search cat breeds...',
          hintStyle: AppStyles.regular16(color: AppColors.grey),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppColors.grey,
            size: 24.sp,
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.grey,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    controller.clear();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
        ),
      ),
    );
  }
}
