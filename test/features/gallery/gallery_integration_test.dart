import 'package:bloc_test/bloc_test.dart';
import 'package:catty/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:catty/features/gallery/presentation/cubit/gallery_state.dart';
import 'package:catty/features/gallery/presentation/pages/gallery_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/test_data.dart';

class MockGalleryCubit extends MockCubit<GalleryState>
    implements GalleryCubit {}

void main() {
  group('Gallery Feature Integration Tests', () {
    late MockGalleryCubit mockGalleryCubit;

    setUp(() {
      mockGalleryCubit = MockGalleryCubit();
    });

    testWidgets(
      'complete flow: should load gallery, display images, and allow search',
      (WidgetTester tester) async {
        // arrange
        final mockImages = GalleryTestData.mockCatImagesWithBreeds();
        when(
          () => mockGalleryCubit.state,
        ).thenReturn(GallerySuccess(mockImages));
        when(
          () => mockGalleryCubit.stream,
        ).thenAnswer((_) => const Stream.empty());

        // act
        await tester.pumpWidget(
          ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) => MaterialApp(
              home: BlocProvider<GalleryCubit>.value(
                value: mockGalleryCubit,
                child: const GalleryView(),
              ),
            ),
          ),
        );

        // assert - verify UI components are rendered
        expect(find.text('Gallery'), findsOneWidget);
        expect(find.text('9 adorable cats'), findsOneWidget);
        expect(find.byIcon(Icons.search_rounded), findsOneWidget);
        expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);

        // verify search functionality
        await tester.enterText(find.byType(TextField), 'Persian');
        await tester.pump();
        expect(find.text('Persian'), findsOneWidget);
      },
    );

    testWidgets('should handle loading state correctly', (
      WidgetTester tester,
    ) async {
      // arrange
      when(() => mockGalleryCubit.state).thenReturn(GalleryLoading());
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: BlocProvider<GalleryCubit>.value(
              value: mockGalleryCubit,
              child: const GalleryView(),
            ),
          ),
        ),
      );

      // assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Gallery'), findsOneWidget);
    });

    testWidgets('should handle error state correctly', (
      WidgetTester tester,
    ) async {
      // arrange
      const errorMessage = 'Failed to load images';
      when(
        () => mockGalleryCubit.state,
      ).thenReturn(GalleryFailure(errorMessage));
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: BlocProvider<GalleryCubit>.value(
              value: mockGalleryCubit,
              child: const GalleryView(),
            ),
          ),
        ),
      );

      // assert
      expect(find.text(errorMessage), findsOneWidget);
      expect(find.text('Gallery'), findsOneWidget);
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
    });

    testWidgets('should handle empty list state', (WidgetTester tester) async {
      // arrange
      when(() => mockGalleryCubit.state).thenReturn(GallerySuccess([]));
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: BlocProvider<GalleryCubit>.value(
              value: mockGalleryCubit,
              child: const GalleryView(),
            ),
          ),
        ),
      );

      // assert
      expect(find.text('Gallery'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('refresh button should be interactive', (
      WidgetTester tester,
    ) async {
      // arrange
      final mockImages = GalleryTestData.mockCatImagesWithBreeds();
      when(() => mockGalleryCubit.state).thenReturn(GallerySuccess(mockImages));
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: BlocProvider<GalleryCubit>.value(
              value: mockGalleryCubit,
              child: const GalleryView(),
            ),
          ),
        ),
      );

      // assert refresh button is tappable
      final refreshButton = find.byIcon(Icons.refresh_rounded);
      expect(refreshButton, findsOneWidget);

      await tester.tap(refreshButton);
      await tester.pump();

      // button should still be visible after tap
      expect(refreshButton, findsOneWidget);
    });

    testWidgets('search bar clear button should work', (
      WidgetTester tester,
    ) async {
      // arrange
      final mockImages = GalleryTestData.mockCatImagesWithBreeds();
      when(() => mockGalleryCubit.state).thenReturn(GallerySuccess(mockImages));
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: BlocProvider<GalleryCubit>.value(
              value: mockGalleryCubit,
              child: const GalleryView(),
            ),
          ),
        ),
      );

      // enter text
      await tester.enterText(find.byType(TextField), 'Persian');
      await tester.pump();
      expect(find.text('Persian'), findsOneWidget);
      expect(find.byIcon(Icons.close_rounded), findsOneWidget);

      // tap clear button
      await tester.tap(find.byIcon(Icons.close_rounded));
      await tester.pump();

      // text should be cleared
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, isEmpty);
    });

    testWidgets('gallery view should maintain state during interaction', (
      WidgetTester tester,
    ) async {
      // arrange
      final mockImages = GalleryTestData.mockCatImagesWithBreeds();
      when(() => mockGalleryCubit.state).thenReturn(GallerySuccess(mockImages));
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: BlocProvider<GalleryCubit>.value(
              value: mockGalleryCubit,
              child: const GalleryView(),
            ),
          ),
        ),
      );

      // interact with search
      await tester.enterText(find.byType(TextField), 'Test');
      await tester.pump();

      // tap refresh
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pump();

      // assert - view should still be intact
      expect(find.text('Gallery'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
