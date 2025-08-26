import 'package:alhayaa_news_app/screens/news_details_screen.dart';
import 'package:alhayaa_news_app/shared/models/article_model.dart';
import 'package:alhayaa_news_app/widgets/common/image_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatelessWidget {
  const AppCarousel({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 150),
      items: [0, 1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsDetailesScreen(article: articles[i]),
                  ),
                ),
                child: Hero(
                  tag: '${articles[i].urlToImage}',
                  child: ImageContainer(
                    image: articles[i].urlToImage,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
