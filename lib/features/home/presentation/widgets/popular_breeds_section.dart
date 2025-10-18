import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:catty/features/home/presentation/widgets/breed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PopularBreedsSection extends StatelessWidget {
  const PopularBreedsSection({super.key});

  static const Color trendingIconColor = Color(0xff9333EA);
  static const Color viewAllTextColor = Color(0xffEA580C);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_up_rounded,
                  color: trendingIconColor,
                  size: 24.sp,
                ),
                Gap(8.w),
                Text(
                  'Popular Breeds',
                  style: AppStyles.bold20(color: AppColors.darkPurple),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              ),
              child: Text(
                'View All',
                style: AppStyles.semiBold14(color: viewAllTextColor),
              ),
            ),
          ],
        ),
        Gap(16.h),
        const BreedListItem(
          imageUrl:
              'https://images.unsplash.com/photo-1573865526739-10c1dd7be1ff',
          breedName: 'Abyssinian',
          location: 'Egypt',
          traits: ['Active', 'Energetic'],
        ),
        Gap(12.h),
        const BreedListItem(
          imageUrl:
              'https://images.unsplash.com/photo-1595433707802-6b2626ef1c91',
          breedName: 'Persian',
          location: 'Iran (Persia)',
          traits: ['Affectionate', 'loyal'],
        ),
        Gap(12.h),
        const BreedListItem(
          imageUrl:
              'https://images.unsplash.com/photo-1513245543132-31f507417b26',
          breedName: 'Siamese',
          location: 'Thailand',
          traits: ['Active', 'Agile'],
        ),
        Gap(12.h),
        const BreedListItem(
          imageUrl:
              'https://images.unsplash.com/photo-1591871937573-74dbba515c4c',
          breedName: 'Bengal',
          location: 'United States',
          traits: ['Alert', 'Agile'],
        ),
      ],
    );
  }
}
