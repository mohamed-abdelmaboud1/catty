import 'package:catty/features/gallery/presentation/pages/gallery_view.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_app_bar.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_grid.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GalleryView Widget Tests', () {
    testWidgets('should display all main components', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      // assert
      expect(find.byType(GalleryAppBar), findsOneWidget);
      expect(find.byType(GallerySearchBar), findsOneWidget);
      expect(find.byType(GalleryGrid), findsOneWidget);
    });

    testWidgets('should have Scaffold with white background', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      // assert
      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, equals(Colors.white));
    });

    testWidgets('should have SafeArea widget', (WidgetTester tester) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      // assert
      expect(find.byType(SafeArea), findsOneWidget);
    });

    testWidgets('search controller should be initialized', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));

      // assert
      expect(textField.controller, isNotNull);
    });

    testWidgets('should accept search input', (WidgetTester tester) async {
      // arrange
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      // act
      await tester.enterText(find.byType(TextField), 'Persian');
      await tester.pump();

      // assert
      expect(find.text('Persian'), findsOneWidget);
    });

    testWidgets('should have Column layout', (WidgetTester tester) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      // assert
      final column = find.descendant(
        of: find.byType(SafeArea),
        matching: find.byType(Column),
      );
      expect(column, findsOneWidget);
    });

    testWidgets('GalleryGrid should be wrapped in Expanded', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      // assert
      final expandedFinder = find.ancestor(
        of: find.byType(GalleryGrid),
        matching: find.byType(Expanded),
      );
      expect(expandedFinder, findsOneWidget);
    });

    testWidgets('should pass selectedFilter to GalleryGrid', (
      WidgetTester tester,
    ) async {
      // arrange & act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const MaterialApp(home: GalleryView()),
        ),
      );

      // assert
      final galleryGrid = tester.widget<GalleryGrid>(find.byType(GalleryGrid));
      expect(galleryGrid.selectedFilter, equals('All'));
    });
  });
}
