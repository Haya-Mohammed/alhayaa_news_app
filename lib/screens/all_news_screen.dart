import 'package:alhayaa_news_app/shared/cubits/news_cubit/news_cubit.dart';
import 'package:alhayaa_news_app/widgets/NewsListSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All News', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: NewsListSection(
              articles: BlocProvider.of<NewsCubit>(context).articles,
            ),
          );
        },
      ),
    );
  }
}
