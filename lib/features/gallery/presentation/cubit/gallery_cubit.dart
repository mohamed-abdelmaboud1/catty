import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/gallery_repo.dart';
import 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final GalleryRepo _repo;
  GalleryCubit(this._repo) : super(GalleryInitial());

  Future<void> fetchGallery() async {
    emit(GalleryLoading());
    try {
      final images = await _repo.fetchGalleryImages();
      emit(GallerySuccess(images));
    } catch (e) {
      emit(GalleryFailure(e.toString()));
    }
  }
}
