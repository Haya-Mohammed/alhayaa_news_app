import 'package:alhayaa_news_app/article_model.dart';
import 'package:alhayaa_news_app/widgets/common/icon_container.dart';
import 'package:alhayaa_news_app/widgets/news_lists/news_List_view.dart';
import 'package:alhayaa_news_app/widgets/news_lists/news_grid_view.dart';
import 'package:alhayaa_news_app/widgets/section_heading.dart';
import 'package:flutter/cupertino.dart';

class NewsListSection extends StatefulWidget {
  final List<Article> articles;
  const NewsListSection({super.key, required this.articles});

  @override
  State<NewsListSection> createState() => _NewsListSectionState();
}

class _NewsListSectionState extends State<NewsListSection> {
  bool _isGridView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// view mode
        const SectionHeading(sectionTitle: 'News For You'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            AppIconContainer(
              icon: _isGridView
                  ? CupertinoIcons.list_bullet
                  : CupertinoIcons.square_grid_2x2,
              onTap: () {
                setState(() {
                  _isGridView = !_isGridView; // Toggle the view mode
                });
              },
            ),
          ],
        ),
        const SizedBox(width: 10),

        /// News List
        _isGridView
            ? NewsGridView(articles: widget.articles!)
            : NewsListView(articles: widget.articles!),
      ],
    );
  }
}
