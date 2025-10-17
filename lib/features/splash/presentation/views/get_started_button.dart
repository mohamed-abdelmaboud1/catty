import 'package:catty/core/routing/routes.dart';
import 'package:catty/core/widgets/border_beam.dart';
import 'package:catty/core/widgets/custom_blur_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderBeam(
      duration: 18,
      borderWidth: 2,
      colorFrom: Colors.brown.shade800,
      colorTo: Colors.white,
      staticBorderColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: CustomBlurButton(
        onPressed: () {
          context.go(Routes.home);
        },
        text: 'Get Started',
      ),
    );
  }
}
