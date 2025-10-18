class BreedModel {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String temperament;
  final String lifeSpan;
  final String? wikipediaUrl;

  BreedModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.temperament,
    required this.lifeSpan,
    this.wikipediaUrl,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      origin: json['origin'] ?? '',
      description: json['description'] ?? '',
      temperament: json['temperament'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      wikipediaUrl: json['wikipedia_url'],
    );
  }
}
