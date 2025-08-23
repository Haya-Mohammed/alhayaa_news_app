import 'package:alhayaa_news_app/article_model.dart';
import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:alhayaa_news_app/shared/cubits/news_cubit/news_cubit.dart';
import 'package:alhayaa_news_app/widgets/NewsListSection.dart';
import 'package:alhayaa_news_app/widgets/categories_list.dart';
import 'package:alhayaa_news_app/widgets/common/icon_container.dart';
import 'package:alhayaa_news_app/widgets/common/image_container.dart';
import 'package:alhayaa_news_app/widgets/section_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: const Icon(
            // Todo: Add logo
            Icons.broken_image_outlined,
            color: AppColors.primary,
          ),
          actions: [
            AppIconContainer(
              icon: CupertinoIcons.search,
              onTap: () {},
            ),
            const SizedBox(width: 5),
            AppIconContainer(
              icon: CupertinoIcons.bell,
              onTap: () {},
            ),
            const SizedBox(width: 5),
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
              return const Center(child: Text("No articles available"));
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

                      /// Image
                      ImageContainer(
                        image: articles[0].urlToImage ?? articles[1].urlToImage,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      const SizedBox(height: 10),

                      /// Categories Tabs
                      const CategoriesList(),
                      const SizedBox(height: 10),
                      NewsListSection(
                        articles: articles,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
