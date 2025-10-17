import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_app_bar.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_grid.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  String selectedFilter = 'All';
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onFilterChanged(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Gap(20.h),
            const GalleryAppBar(),
            Gap(18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  GallerySearchBar(controller: searchController),
                ],
              ),
            ),
            Gap(20.h),
            Expanded(child: GalleryGrid(selectedFilter: selectedFilter)),
          ],
        ),
      ),
    );
  }
}
