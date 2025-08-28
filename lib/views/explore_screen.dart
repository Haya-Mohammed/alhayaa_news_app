import 'package:alhayaa_news_app/core/widgets/news_lists/news_grid_view.dart';
import 'package:alhayaa_news_app/core/widgets/section_heading.dart';
import 'package:alhayaa_news_app/viewmodels/news_cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> categories = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NewsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search news...",
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w300),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.5),
                  ),
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  cubit.getNewsByCategory(value);
                }
              },
            ),
            const SizedBox(height: 20),

            /// Categories
            const SectionHeading(sectionTitle: "Categories"),
            Wrap(
              spacing: 8,
              children: categories.map((keyword) {
                return ActionChip(
                  label: Text(keyword),
                  onPressed: () {
                    context.read<NewsCubit>().getNewsByCategory(keyword);
                  },
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            /// Popular Articles
            const SectionHeading(sectionTitle: "Popular Articles"),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsSuccess) {
                  return NewsGridView(articles: state.articles);
                } else {
                  return const Center(child: Text("No articles found"));
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
