import 'package:catty/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NetworkImageWithFallback extends StatelessWidget {
  final String imageUrl;
  final IconData fallbackIcon;
  final double iconSize;

  const NetworkImageWithFallback({
    super.key,
    required this.imageUrl,
    required this.fallbackIcon,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.grey.withValues(alpha: 0.2),
          child: Icon(fallbackIcon, size: iconSize, color: AppColors.grey),
        );
      },
    );
  }
}
