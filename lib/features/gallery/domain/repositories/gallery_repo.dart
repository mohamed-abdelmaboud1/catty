import 'package:catty/features/gallery/data/models/cat_image_model.dart';


abstract class GalleryRepo {
  Future<List<CatImageModel>> fetchGalleryImages();
}
