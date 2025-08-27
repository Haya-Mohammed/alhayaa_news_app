import 'package:alhayaa_news_app/core/constants/app_colors.dart';
import 'package:alhayaa_news_app/core/constants/image_strings.dart';
import 'package:alhayaa_news_app/core/widgets/NewsListSection.dart';
import 'package:alhayaa_news_app/core/widgets/app_carousel_widget.dart';
import 'package:alhayaa_news_app/core/widgets/category/categories_list.dart';
import 'package:alhayaa_news_app/core/widgets/icon_container.dart';
import 'package:alhayaa_news_app/core/widgets/section_heading.dart';
import 'package:alhayaa_news_app/models/article_model.dart';
import 'package:alhayaa_news_app/viewmodels/news_cubit/news_cubit.dart';
import 'package:alhayaa_news_app/views/all_news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage(AppImages.logo)),
        ),
        actions: [
          AppIconContainer(
            icon: CupertinoIcons.search,
            onTap: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          final cubit = context.read<NewsCubit>();

          List<Article> articles = cubit.articles;

          if (state is NewsLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            ));
          }

          if (articles.isEmpty) {
            return const Center(child: Text("No Internet Connection!"));
          }

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async {
              BlocProvider.of<NewsCubit>(context).getNews();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    /// Section Heading
                    const SectionHeading(sectionTitle: 'Breaking News'),

                    /// Image Slider
                    AppCarousel(articles: articles),

                    const SizedBox(height: 10),

                    /// Categories Tabs
                    const CategoriesList(),
                    const SizedBox(height: 10),

                    /// Section Heading
                    SectionHeading(
                      sectionTitle: 'News For You',
                      action: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const AllNewsScreen()),
                      ),
                    ),

                    /// News Section
                    NewsListSection(
                      articles: articles,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
