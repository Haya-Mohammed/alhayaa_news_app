import 'package:alhayaa_news_app/core/constants/constants.dart';
import 'package:alhayaa_news_app/core/network/local/cache_helper.dart';
import 'package:alhayaa_news_app/models/article_model.dart';
import 'package:alhayaa_news_app/viewmodels/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(bool? fromCache) : super(HomeInitialState()) {
    isDark = fromCache ?? false;
  }

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  /// Navigation
  int selectedIndex = 0;

  void changeIndex(int newIndex) {
    if (selectedIndex == newIndex) return;
    selectedIndex = newIndex;
    emit(NavigationChangedState());
  }

  /// Dark mode
  late bool isDark;

  void changeTheme({bool? fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark);
    }
    emit(ChangeThemeAppState());
  }

  /// Saved Articles
  Box<Article> get _box => Hive.box<Article>(AppConstants.kSavedArticles);
  List<Article> savedArticles = [];

  Future<void> saveArticle(Article article) async {
    if (!savedArticles.any((item) => item.url == article.url)) {
      savedArticles.add(article);
      await _box.put(article.url, article);
      await _box.flush(); // ensures data is written
      emit(ArticleSavedState());
    }
  }

  Future<void> removeArticle(Article article) async {
    savedArticles.removeWhere((item) => item.url == article.url);
    await _box.delete(article.url);
    await _box.flush();
    emit(ArticleRemovedState());
  }

  Future<void> loadSavedArticles() async {
    savedArticles = _box.values.toList();
    emit(SavedArticlesLoadedState());
  }
}
