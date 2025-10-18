import 'package:catty/core/api/dio_module.dart';
import 'package:catty/features/gallery/data/repositories/gallery_repo_impl.dart';
import 'package:catty/features/gallery/domain/repositories/gallery_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/gallery/presentation/cubit/gallery_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<Dio>(() => DioModule(
        
  ).dioInstance);

  // Repo
  getIt.registerLazySingleton<GalleryRepo>(() => GalleryRepoImpl(getIt()));

  // Cubit
  getIt.registerFactory(() => GalleryCubit(getIt()));
}
