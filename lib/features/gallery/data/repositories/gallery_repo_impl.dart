import 'package:catty/features/gallery/data/models/cat_image_model.dart';
import 'package:catty/features/gallery/domain/repositories/gallery_repo.dart';
import 'package:dio/dio.dart';

class GalleryRepoImpl implements GalleryRepo {
  final Dio _dio;

  GalleryRepoImpl(this._dio);

  @override
  Future<List<CatImageModel>> fetchGalleryImages() async {
    try {
      final response = await _dio.get(
        'https://api.thecatapi.com/v1/images/search',
        queryParameters: {'limit': 20, 'has_breeds': 1},
        options: Options(
          responseType: ResponseType.json,

          headers: {
            'x-api-key':
                'live_4wujQ5gZGXOzUTbRNJSkTuKvZzR72Vm1kzum3IG1GNJ5YSw0zcpjbb8dvuTFP0y2',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((json) => CatImageModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load images: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  String _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout, please check your network.';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return 'Server timeout, try again later.';
    } else if (e.response != null) {
      return 'Server error: ${e.response?.statusMessage}';
    } else {
      return 'Unexpected error: ${e.message}';
    }
  }
}
