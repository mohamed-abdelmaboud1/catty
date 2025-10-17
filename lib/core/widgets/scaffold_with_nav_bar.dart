import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/core/utils/app_images.dart';
import 'package:catty/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _icons = [
    (AppImages.imagesHomIcon, 'Home'),
    (AppImages.imagesHeartIcon, 'Heart'),
    (AppImages.imagesMessagesIcon, 'Message'),
    (AppImages.imagesProfileCircleIcon, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, -4),
              color: const Color(0xff000000).withValues(alpha: 0.05),
            ),
          ],
        ),
        child: Row(
          children: List.generate(
            _icons.length,
            (index) => Expanded(
              child: InkWell(
                onTap: () => navigationShell.goBranch(index),
                child: Align(
                  alignment: Alignment.center,
                  child: CustomImage(
                    _icons[index].$1,
                    color: index == navigationShell.currentIndex
                        ? AppColors.primary
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
