import 'package:catty/core/utils/app_colors.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GalleryAppBar Widget Tests', () {
    testWidgets('should display title and subtitle', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) =>
              const MaterialApp(home: Scaffold(body: GalleryAppBar())),
        ),
      );

      // assert
      expect(find.text('Gallery'), findsOneWidget);
      expect(find.text('9 adorable cats'), findsOneWidget);
    });

    testWidgets('should display refresh icon', (WidgetTester tester) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) =>
              const MaterialApp(home: Scaffold(body: GalleryAppBar())),
        ),
      );

      // assert
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
    });

    testWidgets('refresh button should be tappable', (
      WidgetTester tester,
    ) async {
      // arrange
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) =>
              const MaterialApp(home: Scaffold(body: GalleryAppBar())),
        ),
      );

      // act
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pump();

      // assert - no exception should be thrown
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
    });

    testWidgets('should have correct text styles', (WidgetTester tester) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) =>
              const MaterialApp(home: Scaffold(body: GalleryAppBar())),
        ),
      );

      // assert
      final titleWidget = tester.widget<Text>(find.text('Gallery'));
      expect(titleWidget.style?.color, equals(AppColors.darkPurple));
      expect(titleWidget.style?.fontWeight, equals(FontWeight.bold));
    });

    testWidgets('should have GestureDetector wrapping refresh button', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) =>
              const MaterialApp(home: Scaffold(body: GalleryAppBar())),
        ),
      );

      // assert
      final gestureDetectorFinder = find.ancestor(
        of: find.byIcon(Icons.refresh_rounded),
        matching: find.byType(GestureDetector),
      );
      expect(gestureDetectorFinder, findsOneWidget);
    });
  });
}
