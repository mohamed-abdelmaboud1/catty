import 'package:catty/features/gallery/data/models/breed_model.dart';
import 'package:catty/features/gallery/data/models/cat_image_model.dart';

/// Test data factory for Gallery feature tests
class GalleryTestData {
  /// Creates a list of mock cat images with breeds
  static List<CatImageModel> mockCatImagesWithBreeds() {
    return [
      CatImageModel(
        id: '1',
        url: 'https://cdn2.thecatapi.com/images/1.jpg',
        width: 200,
        height: 200,
        breeds: [
          BreedModel(
            id: 'pers',
            name: 'Persian',
            temperament: 'Calm, Sweet, Affectionate',
            origin: 'Iran',
            description: 'A beautiful long-haired cat breed',
            lifeSpan: '12-17 years',
          ),
        ],
      ),
      CatImageModel(
        id: '2',
        url: 'https://cdn2.thecatapi.com/images/2.jpg',
        width: 300,
        height: 300,
        breeds: [
          BreedModel(
            id: 'siam',
            name: 'Siamese',
            temperament: 'Active, Vocal, Intelligent',
            origin: 'Thailand',
            description: 'A sleek and elegant cat breed',
            lifeSpan: '15-20 years',
          ),
        ],
      ),
      CatImageModel(
        id: '3',
        url: 'https://cdn2.thecatapi.com/images/3.jpg',
        width: 250,
        height: 250,
        breeds: [
          BreedModel(
            id: 'maine',
            name: 'Maine Coon',
            temperament: 'Gentle, Friendly, Playful',
            origin: 'United States',
            description: 'One of the largest domestic cat breeds',
            lifeSpan: '12-15 years',
          ),
        ],
      ),
    ];
  }

  /// Creates a list of mock cat images without breeds
  static List<CatImageModel> mockCatImagesWithoutBreeds() {
    return [
      CatImageModel(
        id: '4',
        url: 'https://cdn2.thecatapi.com/images/4.jpg',
        width: 200,
        height: 200,
        breeds: [],
      ),
      CatImageModel(
        id: '5',
        url: 'https://cdn2.thecatapi.com/images/5.jpg',
        width: 300,
        height: 300,
        breeds: [],
      ),
    ];
  }

  /// Creates an empty list of cat images
  static List<CatImageModel> emptyImagesList() {
    return [];
  }

  /// Creates a single cat image with breed
  static CatImageModel singleCatImageWithBreed() {
    return CatImageModel(
      id: 'single',
      url: 'https://cdn2.thecatapi.com/images/single.jpg',
      width: 400,
      height: 400,
      breeds: [
        BreedModel(
          id: 'rag',
          name: 'Ragdoll',
          temperament: 'Docile, Calm, Relaxed',
          origin: 'United States',
          description: 'A large and affectionate cat breed',
          lifeSpan: '12-17 years',
        ),
      ],
    );
  }

  /// Creates a mock error message
  static const String mockErrorMessage = 'Failed to fetch gallery images';

  /// Creates a mock network error
  static Exception mockNetworkException() {
    return Exception('Network error occurred');
  }
}
