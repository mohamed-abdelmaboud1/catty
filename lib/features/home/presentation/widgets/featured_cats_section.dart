import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:catty/features/home/presentation/widgets/cat_grid_card.dart';
import 'package:catty/features/home/presentation/widgets/featured_cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FeaturedCatsSection extends StatelessWidget {
  const FeaturedCatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: const Color(0xffEA580C),
              size: 24.sp,
            ),
            Gap(8.w),
            Text(
              'Featured Cats',
              style: AppStyles.bold20(color: AppColors.darkPurple),
            ),
          ],
        ),
        Gap(20.h),
        const FeaturedCatCard(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW--Za1RHXPmC_0vfxJIwLrjGln_CUJphiSI6ZFJjFj8gMCgc3JBwI8_LYYebMeBCvAWW_12pUU7FWC3FrzvvSxVGv-3KOGgpeg40XtkjmLw',
          breedName: 'Abyssinian',
          location: 'Egypt',
          isFeatured: true,
        ),
        Gap(16.h),
        const Row(
          children: [
            Expanded(
              child: CatGridCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1595433707802-6b2626ef1c91',
                breedName: 'Persian',
              ),
            ),
            Gap(16),
            Expanded(
              child: CatGridCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1513245543132-31f507417b26',
                breedName: 'Siamese',
              ),
            ),
          ],
        ),
        Gap(16.h),
        const Row(
          children: [
            Expanded(
              child: CatGridCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1591871937573-74dbba515c4c',
                breedName: 'Bengal',
              ),
            ),
            Gap(16),
            Expanded(
              child: CatGridCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e',
                breedName: 'British Shorthair',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
