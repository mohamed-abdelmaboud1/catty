import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xffEA580C), Color(0xff9333EA)],
          ).createShader(bounds),
          child: Text(
            'Discover Amazing Cats',
            style: AppStyles.bold24(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Gap(12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Explore hundreds of cat breeds, learn about their unique traits, and find your perfect feline companion',
            style: AppStyles.regular16(color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
