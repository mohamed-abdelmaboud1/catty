import 'package:catty/features/gallery/presentation/widgets/gallery_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GallerySearchBar Widget Tests', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets('should display search hint text', (WidgetTester tester) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(body: GallerySearchBar(controller: controller)),
          ),
        ),
      );

      // assert
      expect(find.text('Search cat breeds...'), findsOneWidget);
    });

    testWidgets('should display search icon', (WidgetTester tester) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(body: GallerySearchBar(controller: controller)),
          ),
        ),
      );

      // assert
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('should accept text input', (WidgetTester tester) async {
      // arrange
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(body: GallerySearchBar(controller: controller)),
          ),
        ),
      );

      // act
      await tester.enterText(find.byType(TextField), 'Persian');
      await tester.pump();

      // assert
      expect(controller.text, equals('Persian'));
      expect(find.text('Persian'), findsOneWidget);
    });

    testWidgets('should show clear button when text is entered', (
      WidgetTester tester,
    ) async {
      // arrange
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(body: GallerySearchBar(controller: controller)),
          ),
        ),
      );

      // act
      await tester.enterText(find.byType(TextField), 'Persian');
      await tester.pump();

      // assert
      expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    });

    testWidgets('clear button should clear the text', (
      WidgetTester tester,
    ) async {
      // arrange
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(body: GallerySearchBar(controller: controller)),
          ),
        ),
      );

      // act
      await tester.enterText(find.byType(TextField), 'Persian');
      await tester.pump();
      expect(controller.text, equals('Persian'));

      await tester.tap(find.byIcon(Icons.close_rounded));
      await tester.pump();

      // assert
      expect(controller.text, isEmpty);
    });

    testWidgets('should not show clear button when text is empty', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(body: GallerySearchBar(controller: controller)),
          ),
        ),
      );

      // assert
      expect(find.byIcon(Icons.close_rounded), findsNothing);
    });

    testWidgets('should have TextField widget', (WidgetTester tester) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(body: GallerySearchBar(controller: controller)),
          ),
        ),
      );

      // assert
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
