import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/features/home/presentation/widgets/cat_explorer_logo.dart';
import 'package:catty/features/home/presentation/widgets/discover_section.dart';
import 'package:catty/features/home/presentation/widgets/featured_cats_section.dart';
import 'package:catty/features/home/presentation/widgets/perfect_match_banner.dart';
import 'package:catty/features/home/presentation/widgets/popular_breeds_section.dart';
import 'package:catty/features/home/presentation/widgets/stats_cards_section.dart';
import 'package:catty/features/home/presentation/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20.h),
                const WelcomeBanner(),
                Gap(40.h),
                const CatExplorerLogo(),
                Gap(24.h),
                const DiscoverSection(),
                Gap(40.h),
                const StatsCardsSection(),
                Gap(40.h),
                const FeaturedCatsSection(),
                Gap(40.h),
                const PopularBreedsSection(),
                Gap(40.h),
                const PerfectMatchBanner(),
                Gap(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
