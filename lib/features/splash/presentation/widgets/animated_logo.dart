import 'package:flutter/material.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_image.dart';

const double _logoBorderRadius = 30.0;

class AnimatedLogo extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> opacityAnimation;

  const AnimatedLogo({
    super.key,
    required this.scaleAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_logoBorderRadius),
              child: CustomImage(AppImages.imagesAppLogo),
            ),
          ),
        );
      },
    );
  }
}
