import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:catty/features/home/presentation/widgets/galss_container.dart';
import 'package:catty/features/home/presentation/widgets/network_image_with_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FeaturedCatCard extends StatelessWidget {
  final String imageUrl;
  final String breedName;
  final String location;
  final bool isFeatured;

  const FeaturedCatCard({
    super.key,
    required this.imageUrl,
    required this.breedName,
    required this.location,
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: NetworkImageWithFallback(
                imageUrl: imageUrl,
                fallbackIcon: Icons.image,
                iconSize: 50.sp,
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
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isFeatured)
                    GalssContainer(
                      child: Text(
                        'Featured',
                        style: AppStyles.bold12(color: AppColors.white),
                      ),
                    ),
                  const Spacer(),
                  Text(
                    breedName,
                    style: AppStyles.bold24(color: AppColors.white),
                  ),
                  Gap(4.h),
                  Text(
                    location,
                    style: AppStyles.regular14(
                      color: AppColors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white.withValues(
                              alpha: 0.95,
                            ),
                            foregroundColor: AppColors.darkPurple,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Learn More',
                            style: AppStyles.bold14(
                              color: AppColors.darkPurple,
                            ),
                          ),
                        ),
                      ),
                      Gap(8.w),
                      _buildIconButton(Icons.download_rounded),
                      Gap(8.w),
                      _buildIconButton(Icons.favorite_border_rounded),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: AppColors.white, size: 20.sp),
        padding: EdgeInsets.all(10.w),
        constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.w),
      ),
    );
  }
}
