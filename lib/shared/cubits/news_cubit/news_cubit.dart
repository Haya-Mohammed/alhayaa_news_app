import 'package:alhayaa_news_app/article_model.dart';
import 'package:alhayaa_news_app/network/remote/dio_helper.dart';
import 'package:alhayaa_news_app/network/remote/end_points.dart';
import 'package:alhayaa_news_app/shared/constants/app_strings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  List<Article> articles = [];

  List<Article> getArticlesList(Map<String, dynamic> data) {
    for (var article in data['items']) {
      articles.add(Article.fromJson(article));
    }
    return articles;
  }

  List<String> categories = [];
  int selectedCategory = 0;

  void getNews() async {
    emit(NewsLoading());
    try {
      final response = await DioHelper.getData(
        endPoint: EndPoints.topHeadlines,
        query: {
          'country': 'us',
          'apiKey': AppStrings.NEWS_API_KEY,
        },
      );
      final List<dynamic> data = response.data['articles'];
      articles = data.map((json) => Article.fromJson(json)).toList();

      emit(NewsSuccess(articles));
    } catch (error) {
      emit(NewsFailure(error.toString()));
    }
  }
}
