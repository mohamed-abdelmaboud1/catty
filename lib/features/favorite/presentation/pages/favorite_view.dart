import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/features/favorite/presentation/widgets/favorite_app_bar.dart';
import 'package:catty/features/favorite/presentation/widgets/favorite_empty_state.dart';
import 'package:catty/features/favorite/presentation/widgets/favorite_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  // Mock data - in real app, this would come from state management
  final List<_FavoriteCatItem> favoriteCats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Gap(20.h),
            FavoriteAppBar(count: favoriteCats.length),
            Gap(24.h),
            Expanded(
              child: favoriteCats.isEmpty
                  ? const FavoriteEmptyState()
                  : FavoriteGrid(favoriteCats: favoriteCats),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteCatItem {
  final String imageUrl;
  final String breedName;

  _FavoriteCatItem({required this.imageUrl, required this.breedName});
}
