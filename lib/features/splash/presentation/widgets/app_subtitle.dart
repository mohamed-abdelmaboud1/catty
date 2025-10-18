import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_styles.dart';

class AppSubtitle extends StatelessWidget {
  const AppSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Find Your Best Companion With Us',
          style: AppStyles.bold34(color: Colors.white60),
          textAlign: TextAlign.center,
        ),
        Gap(8.h),
        Text(
          'Join & discover the best suitable pets as per your preferences in your location',
          style: AppStyles.regular18(color: const Color(0xFF6B7280)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
