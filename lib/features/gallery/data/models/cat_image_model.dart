import 'breed_model.dart';

class CatImageModel {
  final String id;
  final String url;
  final int width;
  final int height;
  final List<BreedModel> breeds;

  CatImageModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.breeds,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) {
    final breedList = (json['breeds'] as List?)
            ?.map((b) => BreedModel.fromJson(b))
            .toList() ??
        [];

    return CatImageModel(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      breeds: breedList,
    );
  }
}
