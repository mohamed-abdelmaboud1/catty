import 'package:catty/core/cache/cache_manager.dart';
import 'package:flutter/material.dart';

import 'catty_app.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.init();
  await setupServiceLocator();
  runApp(const CattyApp());
}
