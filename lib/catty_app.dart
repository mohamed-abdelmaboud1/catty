import 'package:catty/core/constant/app_constants.dart';
import 'package:catty/core/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/custom_scroll_behavior.dart';
import 'core/routing/app_router.dart';

class CattyApp extends StatelessWidget {
  const CattyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: !kReleaseMode && true,
      builder: (context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        fontSizeResolver: (fontSize, scaleFactor) {
          // Clamp the scale factor between 0.8 and 1.2
          double clampedScaleFactor = scaleFactor.scaleText.clamp(0.8, 1.2);
          return fontSize * clampedScaleFactor;
        },
        enableScaleWH: () => false,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            routerConfig: AppRouter.router,
            builder: DevicePreview.appBuilder,
            scrollBehavior: CustomScrollBehavior(),
            locale: const Locale('en'),
            themeMode: ThemeMode.light,
            theme: AppTheme.light,
          );
        },
      ),
    );
  }
}
