import 'package:alhayaa_news_app/article_model.dart';
import 'package:alhayaa_news_app/screens/news_details_screen.dart';
import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:alhayaa_news_app/widgets/common/image_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListNewsCard extends StatelessWidget {
  const ListNewsCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => NewsDetailesScreen(article: article),
          ),
        );
      },
      child: Card(
        color: AppColors.background,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            children: [
              /// Image
              Expanded(
                flex: 3,
                child: ImageContainer(
                  image: article.urlToImage,
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.28,
                ),
              ),
              const SizedBox(width: 10),

              /// Info
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        article.title ?? 'No title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    /// Short description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        article.description ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        DateFormat('MM/dd/yyyy, hh:mm a')
                            .format(article.publishedAt!)
                            .toString(),
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
