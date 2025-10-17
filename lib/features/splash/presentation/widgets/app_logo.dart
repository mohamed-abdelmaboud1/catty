import 'package:catty/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  static const double _shadowOpacity = 0.08;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:_shadowOpacity),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: CustomImage(
        AppImages.imagesAppLogo,
        fit: BoxFit.cover,
      ),
    );
  }
}
