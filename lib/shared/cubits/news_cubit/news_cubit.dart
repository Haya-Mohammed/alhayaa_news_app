import 'package:alhayaa_news_app/network/remote/dio_helper.dart';
import 'package:alhayaa_news_app/network/remote/end_points.dart';
import 'package:alhayaa_news_app/shared/constants/constants.dart';
import 'package:alhayaa_news_app/shared/models/article_model.dart';
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
      //  Todo: CacheHelper.saveData(key: '', value: '');
      emit(NewsSuccess(articles));
    } catch (error) {
      emit(NewsFailure(error.toString()));
    }
  }

  List<String> categories = [];
  int selectedCategory = 0;
// Todo
//   void changeCategory(int index) {
//     selectedCategory = index;
//     emit(CategoryChanged());
//     getNewsByCategory(categories[index]);
//   }
}
