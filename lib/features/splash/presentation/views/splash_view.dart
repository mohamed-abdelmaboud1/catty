import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/splash_view_body.dart';

class SplashView extends HookWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final logoController = useAnimationController(
      duration: const Duration(milliseconds: 1200),
    );
    final sloganController = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );

    final logoScaleAnimation = useMemoized(
      () => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: logoController, curve: Curves.elasticOut),
      ),
    );
    final logoOpacityAnimation = useMemoized(
      () => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: logoController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
        ),
      ),
    );
    final sloganSlideAnimation = useMemoized(
      () => Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(
        CurvedAnimation(parent: sloganController, curve: Curves.easeOutBack),
      ),
    );
    final sloganOpacityAnimation = useMemoized(
      () => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: sloganController, curve: Curves.easeIn),
      ),
    );

    useEffect(() {
      Future<void> startAnimations() async {
        await logoController.forward();
        await Future.delayed(const Duration(milliseconds: 500));
        await sloganController.forward();
        await Future.delayed(const Duration(milliseconds: 1000));
        if (context.mounted) {
          _navigateTo(context);
        }
      }

      startAnimations();
      return null;
    }, []);

    return Scaffold(
      body: SplashViewBody(
        logoScaleAnimation: logoScaleAnimation,
        logoOpacityAnimation: logoOpacityAnimation,
      ),
    );
  }

  void _navigateTo(BuildContext context) {
    context.go(Routes.getStarted);
  }
}
