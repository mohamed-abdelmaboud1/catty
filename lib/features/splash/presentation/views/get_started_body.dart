import 'package:catty/core/utils/app_images.dart';
import 'package:catty/features/splash/presentation/views/get_started_button.dart';
import 'package:catty/features/splash/presentation/widgets/app_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  static const BoxDecoration _backgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImages.imagesWhiteCatLookingRightDark),
      fit: BoxFit.cover,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _backgroundDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const AppSubtitle(),
            const Spacer(flex: 1),
            const GetStartedButton(),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
