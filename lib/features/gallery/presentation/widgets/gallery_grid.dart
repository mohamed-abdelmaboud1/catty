import 'package:catty/features/home/presentation/widgets/cat_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryGrid extends StatelessWidget {
  final String selectedFilter;

  const GalleryGrid({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration
    final List<_CatItem> catItems = [
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1574158622682-e40e69881006',
        breedName: 'British Shorthair',
      ),
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1573865526739-10c1dd7be1ff',
        breedName: 'Abyssinian',
      ),
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1595433707802-6b2626ef1c91',
        breedName: 'Persian',
      ),
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1513245543132-31f507417b26',
        breedName: 'Siamese',
      ),
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1591871937573-74dbba515c4c',
        breedName: 'Bengal',
      ),
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e',
        breedName: 'Scottish Fold',
      ),
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1592194996308-7b43878e84a6',
        breedName: 'Ragdoll',
      ),
      _CatItem(
        imageUrl:
            'https://images.unsplash.com/photo-1518791841217-8f162f1e1131',
        breedName: 'Maine Coon',
      ),
      _CatItem(
        imageUrl: 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce',
        breedName: 'Sphynx',
      ),
    ];

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
        itemCount: catItems.length,
        itemBuilder: (context, index) {
          final item = catItems[index];
          return CatGridCard(
            imageUrl: item.imageUrl,
            breedName: item.breedName,
          );
        },
      ),
    );
  }
}

class _CatItem {
  final String imageUrl;
  final String breedName;

  _CatItem({required this.imageUrl, required this.breedName});
}
