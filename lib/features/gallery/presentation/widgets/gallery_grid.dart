import 'package:catty/features/home/presentation/widgets/cat_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/models/cat_image_model.dart';
import '../cubit/gallery_cubit.dart';
import '../cubit/gallery_state.dart';

class GalleryGrid extends StatelessWidget {
  final String selectedFilter;

  const GalleryGrid({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GalleryCubit>()..fetchGallery(),
      child: BlocBuilder<GalleryCubit, GalleryState>(
        builder: (context, state) {
          if (state is GalleryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GalleryFailure) {
            return Center(child: Text(state.message));
          } else if (state is GallerySuccess) {
            return _buildGrid(state.images);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildGrid(List<CatImageModel> cats) {
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
        itemCount: cats.length,
        itemBuilder: (context, index) {
          final cat = cats[index];
          final breedName = cat.breeds.isNotEmpty
              ? cat.breeds.first.name
              : 'Unknown Breed';
          return CatGridCard(imageUrl: cat.url, breedName: breedName);
        },
      ),
    );
  }
}
