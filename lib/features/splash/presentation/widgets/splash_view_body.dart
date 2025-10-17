import 'package:flutter/material.dart';
import 'animated_logo.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required this.logoScaleAnimation,
    required this.logoOpacityAnimation,

  });

  final Animation<double> logoScaleAnimation;
  final Animation<double> logoOpacityAnimation;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedLogo(
            scaleAnimation: logoScaleAnimation,
            opacityAnimation: logoOpacityAnimation,
          ),
    );
  }
}
