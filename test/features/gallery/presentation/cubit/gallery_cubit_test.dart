import 'package:bloc_test/bloc_test.dart';
import 'package:catty/features/gallery/data/models/breed_model.dart';
import 'package:catty/features/gallery/data/models/cat_image_model.dart';
import 'package:catty/features/gallery/domain/repositories/gallery_repo.dart';
import 'package:catty/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:catty/features/gallery/presentation/cubit/gallery_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGalleryRepo extends Mock implements GalleryRepo {}

void main() {
  late GalleryCubit galleryCubit;
  late MockGalleryRepo mockGalleryRepo;

  setUp(() {
    mockGalleryRepo = MockGalleryRepo();
    galleryCubit = GalleryCubit(mockGalleryRepo);
  });

  tearDown(() {
    galleryCubit.close();
  });

  group('GalleryCubit', () {
    final tCatImages = [
      CatImageModel(
        id: '1',
        url: 'https://example.com/cat1.jpg',
        width: 200,
        height: 200,
        breeds: [
          BreedModel(
            lifeSpan: '12-15 years',
            description: 'A calm and sweet breed',
            id: 'breed1',
            name: 'Persian',
            temperament: 'Calm, Sweet',
            origin: 'Iran',
          ),
        ],
      ),
      CatImageModel(
        id: '2',
        url: 'https://example.com/cat2.jpg',
        width: 300,
        height: 300,
        breeds: [],
      ),
    ];

    test('initial state should be GalleryInitial', () {
      // assert
      expect(galleryCubit.state, equals(GalleryInitial()));
    });

    blocTest<GalleryCubit, GalleryState>(
      'emits [GalleryLoading, GallerySuccess] when fetchGallery is successful',
      build: () {
        when(
          () => mockGalleryRepo.fetchGalleryImages(),
        ).thenAnswer((_) async => tCatImages);
        return galleryCubit;
      },
      act: (cubit) => cubit.fetchGallery(),
      expect: () => [GalleryLoading(), GallerySuccess(tCatImages)],
      verify: (_) {
        verify(() => mockGalleryRepo.fetchGalleryImages()).called(1);
      },
    );

    blocTest<GalleryCubit, GalleryState>(
      'emits [GalleryLoading, GalleryFailure] when fetchGallery fails',
      build: () {
        when(
          () => mockGalleryRepo.fetchGalleryImages(),
        ).thenThrow(Exception('Failed to fetch gallery images'));
        return galleryCubit;
      },
      act: (cubit) => cubit.fetchGallery(),
      expect: () => [
        GalleryLoading(),
        GalleryFailure('Exception: Failed to fetch gallery images'),
      ],
      verify: (_) {
        verify(() => mockGalleryRepo.fetchGalleryImages()).called(1);
      },
    );

    blocTest<GalleryCubit, GalleryState>(
      'emits [GalleryLoading, GallerySuccess] with empty list when no images',
      build: () {
        when(
          () => mockGalleryRepo.fetchGalleryImages(),
        ).thenAnswer((_) async => []);
        return galleryCubit;
      },
      act: (cubit) => cubit.fetchGallery(),
      expect: () => [GalleryLoading(), GallerySuccess([])],
      verify: (_) {
        verify(() => mockGalleryRepo.fetchGalleryImages()).called(1);
      },
    );
  });

  group('GalleryState', () {
    test('GalleryInitial props should be empty', () {
      expect(GalleryInitial().props, equals([]));
    });

    test('GalleryLoading props should be empty', () {
      expect(GalleryLoading().props, equals([]));
    });

    test('GallerySuccess props should contain images', () {
      final images = [
        CatImageModel(
          id: '1',
          url: 'test.jpg',
          width: 100,
          height: 100,
          breeds: [],
        ),
      ];
      final state = GallerySuccess(images);
      expect(state.props, equals([images]));
    });

    test('GalleryFailure props should contain message', () {
      const message = 'Error message';
      final state = GalleryFailure(message);
      expect(state.props, equals([message]));
    });

    test('two GallerySuccess with same images should be equal', () {
      final images = [
        CatImageModel(
          id: '1',
          url: 'test.jpg',
          width: 100,
          height: 100,
          breeds: [],
        ),
      ];
      final state1 = GallerySuccess(images);
      final state2 = GallerySuccess(images);
      expect(state1, equals(state2));
    });

    test('two GalleryFailure with same message should be equal', () {
      const message = 'Error message';
      final state1 = GalleryFailure(message);
      final state2 = GalleryFailure(message);
      expect(state1, equals(state2));
    });
  });
}
