import 'package:alhayaa_news_app/shared/models/article_model.dart';
import 'package:alhayaa_news_app/widgets/news_lists/list_news_card.dart';
import 'package:flutter/material.dart';

class NewsListView extends StatelessWidget {
  NewsListView({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListNewsCard(article: article!);
      },
    );
  }
}
