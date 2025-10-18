import 'package:catty/features/home/presentation/widgets/cat_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteGrid extends StatelessWidget {
  final List<dynamic> favoriteCats;

  const FavoriteGrid({super.key, required this.favoriteCats});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFAFAFA),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.85,
        ),
        itemCount: favoriteCats.length,
        itemBuilder: (context, index) {
          final item = favoriteCats[index];
          return CatGridCard(
            imageUrl: item.imageUrl,
            breedName: item.breedName,
          );
        },
      ),
    );
  }
}
