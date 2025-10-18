import 'package:equatable/equatable.dart';
import '../../data/models/cat_image_model.dart';

abstract class GalleryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GallerySuccess extends GalleryState {
  final List<CatImageModel> images;
  GallerySuccess(this.images);
  @override
  List<Object?> get props => [images];
}

class GalleryFailure extends GalleryState {
  final String message;
  GalleryFailure(this.message);
  @override
  List<Object?> get props => [message];
}
