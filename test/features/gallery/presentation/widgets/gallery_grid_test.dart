import 'package:bloc_test/bloc_test.dart';
import 'package:catty/features/gallery/data/models/breed_model.dart';
import 'package:catty/features/gallery/data/models/cat_image_model.dart';
import 'package:catty/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:catty/features/gallery/presentation/cubit/gallery_state.dart';
import 'package:catty/features/gallery/presentation/widgets/gallery_grid.dart';
import 'package:catty/features/home/presentation/widgets/cat_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGalleryCubit extends MockCubit<GalleryState>
    implements GalleryCubit {}

void main() {
  group('GalleryGrid Widget Tests', () {
    late MockGalleryCubit mockGalleryCubit;

    setUp(() {
      mockGalleryCubit = MockGalleryCubit();
    });

    testWidgets(
      'should display loading indicator when state is GalleryLoading',
      (WidgetTester tester) async {
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
              home: Scaffold(
                body: BlocProvider<GalleryCubit>.value(
                  value: mockGalleryCubit,
                  child: const GalleryGrid(selectedFilter: 'All'),
                ),
              ),
            ),
          ),
        );

        // assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets('should display error message when state is GalleryFailure', (
      WidgetTester tester,
    ) async {
      // arrange
      const errorMessage = 'Failed to load gallery';
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
            home: Scaffold(
              body: BlocProvider<GalleryCubit>.value(
                value: mockGalleryCubit,
                child: const GalleryGrid(selectedFilter: 'All'),
              ),
            ),
          ),
        ),
      );

      // assert
      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('should display grid when state is GallerySuccess', (
      WidgetTester tester,
    ) async {
      // arrange
      final mockImages = [
        CatImageModel(
          id: '1',
          url: 'https://example.com/cat1.jpg',
          width: 200,
          height: 200,
          breeds: [
            BreedModel(
              id: 'breed1',
              lifeSpan: '12-15 years',
              name: 'Persian',
              description: 'A calm and sweet breed',
              temperament: 'Calm',
              origin: 'Iran',
            ),
          ],
        ),
        CatImageModel(
          id: '2',
          url: 'https://example.com/cat2.jpg',
          width: 300,
          height: 300,
          breeds: [
            BreedModel(
              lifeSpan: '12-15 years',
              id: 'breed2',
              name: 'Siamese',
              description: 'An active and social breed',
              temperament: 'Active',
              origin: 'Thailand',
            ),
          ],
        ),
      ];

      when(() => mockGalleryCubit.state).thenReturn(GallerySuccess(mockImages));
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: BlocProvider<GalleryCubit>.value(
                value: mockGalleryCubit,
                child: const GalleryGrid(selectedFilter: 'All'),
              ),
            ),
          ),
        ),
      );

      // assert
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(CatGridCard), findsNWidgets(2));
    });

    testWidgets('should display "Unknown Breed" when breed is not available', (
      WidgetTester tester,
    ) async {
      // arrange
      final mockImages = [
        CatImageModel(
          id: '1',
          url: 'https://example.com/cat1.jpg',
          width: 200,
          height: 200,
          breeds: [],
        ),
      ];

      when(() => mockGalleryCubit.state).thenReturn(GallerySuccess(mockImages));
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: BlocProvider<GalleryCubit>.value(
                value: mockGalleryCubit,
                child: const GalleryGrid(selectedFilter: 'All'),
              ),
            ),
          ),
        ),
      );

      // assert
      expect(find.byType(CatGridCard), findsOneWidget);
      expect(find.text('Unknown Breed'), findsOneWidget);
    });

    testWidgets('should display empty view when images list is empty', (
      WidgetTester tester,
    ) async {
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
            home: Scaffold(
              body: BlocProvider<GalleryCubit>.value(
                value: mockGalleryCubit,
                child: const GalleryGrid(selectedFilter: 'All'),
              ),
            ),
          ),
        ),
      );

      // assert
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(CatGridCard), findsNothing);
    });

    testWidgets('should display SizedBox.shrink when state is GalleryInitial', (
      WidgetTester tester,
    ) async {
      // arrange
      when(() => mockGalleryCubit.state).thenReturn(GalleryInitial());
      when(
        () => mockGalleryCubit.stream,
      ).thenAnswer((_) => const Stream.empty());

      // act
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: BlocProvider<GalleryCubit>.value(
                value: mockGalleryCubit,
                child: const GalleryGrid(selectedFilter: 'All'),
              ),
            ),
          ),
        ),
      );

      // assert
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(GridView), findsNothing);
    });
  });
}
