import 'package:alhayaa_news_app/core/constants/constants.dart';
import 'package:alhayaa_news_app/core/network/remote/dio_helper.dart';
import 'package:alhayaa_news_app/core/network/remote/end_points.dart';
import 'package:alhayaa_news_app/models/article_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  List<Article> articles = [];

  List<Article> getArticlesList(Map<String, dynamic> data) {
    articles = (data['items'] as List)
        .map((article) => Article.fromJson(article))
        .toList();
    return articles;
  }

  void getNews() async {
    emit(NewsLoading());
    try {
      final response = await DioHelper.getData(
        endPoint: EndPoints.topHeadlines,
        query: {
          'country': 'us',
          'apiKey': AppConstants.NEWS_API_KEY,
        },
      );
      final List<dynamic> data = response.data['articles'];
      articles = data.map((json) => Article.fromJson(json)).toList();
      emit(NewsSuccess(articles));
    } catch (error) {
      emit(NewsFailure(error.toString()));
    }
  }

  void getNewsByCategory(String? category) async {
    emit(NewsLoading());
    try {
      final response = await DioHelper.getData(
        endPoint: EndPoints.everything,
        query: {
          'q': category,
          'apiKey': AppConstants.NEWS_API_KEY,
        },
      );
      final List<dynamic> data = response.data['articles'];
      articles = data.map((json) => Article.fromJson(json)).toList();
      emit(NewsSuccess(articles));
    } catch (error) {
      emit(NewsFailure(error.toString()));
    }
  }

  int selectedCategoryIndex = 0;

  void changeCategory(int index, String category) {
    selectedCategoryIndex = index;
    emit(NewsCategoryChanged());

    if (category == 'All') {
      getNews();
    } else {
      getNewsByCategory(category);
    }
  }
}
