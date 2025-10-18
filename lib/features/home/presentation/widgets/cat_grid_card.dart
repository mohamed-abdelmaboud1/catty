import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:catty/features/home/presentation/widgets/network_image_with_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatGridCard extends StatelessWidget {
  final String imageUrl;
  final String breedName;

  const CatGridCard({
    super.key,
    required this.imageUrl,
    required this.breedName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: NetworkImageWithFallback(
                imageUrl: imageUrl,
                fallbackIcon: Icons.image,
                iconSize: 40.sp,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.6),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.favorite_border_rounded,
                  size: 18.sp,
                  color: AppColors.darkPurple,
                ),
              ),
            ),
            Positioned(
              bottom: 12.h,
              left: 12.w,
              right: 12.w,
              child: Text(
                breedName,
                style: AppStyles.semiBold16(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
