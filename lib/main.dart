import 'package:alhayaa_news_app/app.dart';
import 'package:alhayaa_news_app/bloc_observer.dart';
import 'package:alhayaa_news_app/core/constants/constants.dart';
import 'package:alhayaa_news_app/core/network/local/cache_helper.dart';
import 'package:alhayaa_news_app/core/network/remote/dio_helper.dart';
import 'package:alhayaa_news_app/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  /// Local init
  await Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(ArticleAdapter());
  await Hive.openBox<Article>(AppConstants.kSavedArticles);
  await CacheHelper.init();

  /// Remote init
  DioHelper.init();

  /// state management
  Bloc.observer = MyBlocObserver();

  /// init
  final bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark: isDark));
  FlutterNativeSplash.remove();
}
