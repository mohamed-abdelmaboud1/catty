import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:catty/features/home/presentation/widgets/network_image_with_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BreedListItem extends StatelessWidget {
  final String imageUrl;
  final String breedName;
  final String location;
  final List<String> traits;

  const BreedListItem({
    super.key,
    required this.imageUrl,
    required this.breedName,
    required this.location,
    required this.traits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: NetworkImageWithFallback(
                imageUrl: imageUrl,
                fallbackIcon: Icons.pets,
                iconSize: 30.sp,
              ),
            ),
          ),
          Gap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  breedName,
                  style: AppStyles.bold16(color: AppColors.darkPurple),
                ),
                Gap(4.h),
                Text(
                  location,
                  style: AppStyles.regular14(color: AppColors.darkGrey),
                ),
                Gap(8.h),
                Wrap(
                  spacing: 6.w,
                  runSpacing: 4.h,
                  children: traits
                      .map(
                        (trait) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffF3F4F6),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            trait,
                            style: AppStyles.regular12(
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
