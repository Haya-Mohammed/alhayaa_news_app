import 'package:alhayaa_news_app/shared/constants/app_strings.dart';
import 'package:alhayaa_news_app/shared/constants/image_strings.dart';
import 'package:alhayaa_news_app/shared/models/article_model.dart';
import 'package:alhayaa_news_app/widgets/common/icon_container.dart';
import 'package:alhayaa_news_app/widgets/common/image_container.dart';
import 'package:alhayaa_news_app/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailesScreen extends StatelessWidget {
  final Article article;
  NewsDetailesScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.detailsPageTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: AppIconContainer(
          icon: Icons.arrow_back_ios,
          onTap: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          iconSize: 16,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        actions: [
          SaveButton(article: article),
          const SizedBox(width: 5),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Image
              Hero(
                tag: '${article.urlToImage}',
                child: ImageContainer(
                  image: article.urlToImage ?? AppImages.placeholderImage,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
              const SizedBox(height: 10),

              /// Author
              Text(
                'By: ${article.author}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 5),

              /// Title
              Text(
                article.title ?? 'No title',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 5),

              /// Short description
              Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),

              /// Article url
              Row(
                children: [
                  Text(
                    'For more info tap ',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri _url =
                          Uri.parse(article.url ?? 'https://google.com');
                      if (!await launchUrl(_url)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.error_outline),
                              Text('Could not launch $_url'),
                            ],
                          ),
                        )));
                      }
                    },
                    child: Text(
                      'here',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                DateFormat('MM/dd/yyyy, hh:mm a')
                    .format(article.publishedAt!)
                    .toString(),
                style: Theme.of(context).textTheme.labelSmall,
                maxLines: 2,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
