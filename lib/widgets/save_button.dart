import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:alhayaa_news_app/shared/models/article_model.dart';
import 'package:alhayaa_news_app/widgets/common/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  final Article article;

  const SaveButton({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        bool isSaved = cubit.savedArticles.any((a) => a.url == article.url);

        return AppIconContainer(
          icon: isSaved ? Icons.bookmark : Icons.bookmark_border,
          iconColor:
              isSaved ? AppColors.primary : Theme.of(context).iconTheme.color!,
          margin: const EdgeInsets.only(left: 10),
          onTap: () {
            if (isSaved) {
              cubit.removeArticle(article);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Removed from saved")),
              );
            } else {
              cubit.saveArticle(article);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Article saved!")),
              );
            }
          },
        );
      },
    );
  }
}
