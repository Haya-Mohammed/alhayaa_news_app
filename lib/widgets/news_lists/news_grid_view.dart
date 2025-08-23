import 'package:alhayaa_news_app/widgets/news_lists/grid_news_card.dart';
import 'package:flutter/material.dart';

class NewsGridView extends StatelessWidget {
  NewsGridView({
    super.key,
    required this.articles,
  });

  final List articles;
  final Set<int> favoriteIndexes = {};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        var isFavorite = favoriteIndexes.contains(index);

        return GridNewsCard(article: article);
      },
    );
  }
}
