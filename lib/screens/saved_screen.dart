import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:alhayaa_news_app/widgets/NewsListSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var savedArticles = HomeCubit.get(context).savedArticles;

          if (savedArticles.isEmpty) {
            return const Center(child: Text("No saved articles"));
          }

          return NewsListSection(articles: savedArticles);
        },
      ),
    );
  }
}
