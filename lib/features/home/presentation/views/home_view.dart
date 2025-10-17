import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_styles.dart';
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

class PopularBreedsSection extends StatelessWidget {
  const PopularBreedsSection({super.key});

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
                  Icons.trending_up,
                  color: AppColors.secondary,
                  size: 24.sp,
                ),
                Gap(8.w),
                Text(
                  'Popular Breeds',
                  style: AppStyles.bold20(
                    color: AppColors.darkPurple,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: AppStyles.semiBold14(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        Gap(16.h),
        const BreedListItem(
          imageUrl: 'https://images.unsplash.com/photo-1573865526739-10c1dd7be1ff',
          breedName: 'Abyssinian',
          location: 'Egypt',
          traits: ['Active', 'Energetic'],
        ),
        Gap(12.h),
        const BreedListItem(
          imageUrl: 'https://images.unsplash.com/photo-1595433707802-6b2626ef1c91',
          breedName: 'Persian',
          location: 'Iran (Persia)',
          traits: ['Affectionate', 'loyal'],
        ),
        Gap(12.h),
        const BreedListItem(
          imageUrl: 'https://images.unsplash.com/photo-1513245543132-31f507417b26',
          breedName: 'Siamese',
          location: 'Thailand',
          traits: ['Active', 'Agile'],
        ),
        Gap(12.h),
        const BreedListItem(
          imageUrl: 'https://images.unsplash.com/photo-1591871937573-74dbba515c4c',
          breedName: 'Bengal',
          location: 'United States',
          traits: ['Alert', 'Agile'],
        ),
      ],
    );
  }
}

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
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Cat Image
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.grey.withOpacity(0.2),
                    child: Icon(
                      Icons.pets,
                      size: 30.sp,
                      color: AppColors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Gap(16.w),
          // Breed Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  breedName,
                  style: AppStyles.bold16(
                    color: AppColors.darkPurple,
                  ),
                ),
                Gap(4.h),
                Text(
                  location,
                  style: AppStyles.regular14(
                    color: AppColors.darkGrey,
                  ),
                ),
                Gap(8.h),
                // Traits
                Wrap(
                  spacing: 6.w,
                  children: traits.map((trait) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryShade,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        trait,
                        style: AppStyles.regular12(
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PerfectMatchBanner extends StatelessWidget {
  const PerfectMatchBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.lightBeige,
            AppColors.lightBeige.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.secondary.withOpacity(0.8),
                  AppColors.primary.withOpacity(0.8),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.pets,
              color: AppColors.white,
              size: 40.sp,
            ),
          ),
          Gap(16.h),
          Text(
            'Ready to find your perfect match?',
            style: AppStyles.bold18(
              color: AppColors.darkPurple,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(12.h),
          Text(
            'Take our quiz to discover which cat breed suits your lifestyle best',
            style: AppStyles.regular14(
              color: AppColors.darkGrey,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                'Start Quiz',
                style: AppStyles.bold16(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.lightBeige,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.pets,
              color: AppColors.secondary,
              size: 20.sp,
            ),
          ),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Welcome to Cat Explorer! 🐱',
                        style: AppStyles.bold16(
                          color: AppColors.darkPurple,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Close banner
                      },
                      child: Icon(
                        Icons.close,
                        size: 18.sp,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                Text(
                  'Discover amazing cat breeds, save your favorites, and learn everything about these adorable companions.',
                  style: AppStyles.regular14(
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CatExplorerLogo extends StatelessWidget {
  const CatExplorerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120.w,
        height: 120.w,
        decoration: BoxDecoration(
          color: AppColors.primaryShade,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.pets,
          size: 60.sp,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Discover Amazing Cats',
          style: AppStyles.bold24(
            color: AppColors.secondary,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Explore hundreds of cat breeds, learn about their unique traits, and find your perfect feline companion',
            style: AppStyles.regular16(
              color: AppColors.darkGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class StatsCardsSection extends StatelessWidget {
  const StatsCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatsCard(
            icon: Icons.pets,
            iconColor: AppColors.secondary,
            label: 'Breeds',
            value: '8+',
            backgroundColor: AppColors.white,
          ),
        ),
        Gap(16.w),
        Expanded(
          child: StatsCard(
            icon: Icons.photo_library,
            iconColor: AppColors.primary,
            label: 'Photos',
            value: '1000+',
            backgroundColor: AppColors.white,
          ),
        ),
        Gap(16.w),
        Expanded(
          child: StatsCard(
            icon: Icons.favorite,
            iconColor: AppColors.secondary,
            label: 'Favorites',
            value: '0',
            backgroundColor: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final Color backgroundColor;

  const StatsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24.sp,
            ),
          ),
          Gap(12.h),
          Text(
            label,
            style: AppStyles.medium14(
              color: AppColors.darkGrey,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(4.h),
          Text(
            value,
            style: AppStyles.bold20(
              color: AppColors.darkPurple,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

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
              Icons.star,
              color: AppColors.secondary,
              size: 24.sp,
            ),
            Gap(8.w),
            Text(
              'Featured Cats',
              style: AppStyles.bold20(
                color: AppColors.darkPurple,
              ),
            ),
          ],
        ),
        Gap(20.h),
        const FeaturedCatCard(
          imageUrl: 'https://images.unsplash.com/photo-1573865526739-10c1dd7be1ff',
          breedName: 'Abyssinian',
          location: 'Egypt',
          isFeatured: true,
        ),
        Gap(16.h),
        Row(
          children: [
            Expanded(
              child: CatGridCard(
                imageUrl: 'https://images.unsplash.com/photo-1595433707802-6b2626ef1c91',
                breedName: 'Persian',
              ),
            ),
            Gap(16.w),
            Expanded(
              child: CatGridCard(
                imageUrl: 'https://images.unsplash.com/photo-1513245543132-31f507417b26',
                breedName: 'Siamese',
              ),
            ),
          ],
        ),
        Gap(16.h),
        Row(
          children: [
            Expanded(
              child: CatGridCard(
                imageUrl: 'https://images.unsplash.com/photo-1591871937573-74dbba515c4c',
                breedName: 'Bengal',
              ),
            ),
            Gap(16.w),
            Expanded(
              child: CatGridCard(
                imageUrl: 'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e',
                breedName: 'British Shorthair',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.grey.withOpacity(0.2),
                    child: Icon(
                      Icons.image,
                      size: 50.sp,
                      color: AppColors.grey,
                    ),
                  );
                },
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isFeatured)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Featured',
                        style: AppStyles.bold12(
                          color: AppColors.darkPurple,
                        ),
                      ),
                    ),
                  const Spacer(),
                  Text(
                    breedName,
                    style: AppStyles.bold24(
                      color: AppColors.white,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    location,
                    style: AppStyles.regular14(
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.white.withOpacity(0.2),
                          padding: EdgeInsets.all(10.w),
                        ),
                      ),
                      Gap(8.w),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.white.withOpacity(0.2),
                          padding: EdgeInsets.all(10.w),
                        ),
                      ),
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
}

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
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.grey.withOpacity(0.2),
                    child: Icon(
                      Icons.image,
                      size: 40.sp,
                      color: AppColors.grey,
                    ),
                  );
                },
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
            ),
            // Favorite Button
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
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 18.sp,
                  color: AppColors.darkPurple,
                ),
              ),
            ),
            // Breed Name
            Positioned(
              bottom: 12.h,
              left: 12.w,
              right: 12.w,
              child: Text(
                breedName,
                style: AppStyles.semiBold16(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}