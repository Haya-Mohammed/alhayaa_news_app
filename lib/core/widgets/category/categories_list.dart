import 'package:alhayaa_news_app/core/widgets/category/category_list_item.dart';
import 'package:alhayaa_news_app/viewmodels/news_cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NewsCubit>();
    final List<String> categories = [
      'All',
      'Sports',
      'Education',
      'Business',
      'Entertainment',
      'Health',
      'Science',
      'Technology',
    ];

    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = cubit.selectedCategoryIndex == index;
          return CategoryListItem(
            key: ValueKey(categories[index]),
            name: categories[index],
            isSelected: isSelected,
            onTap: () {
              cubit.changeCategory(index, categories[index]);
              cubit.getNewsByCategory(categories[index].toLowerCase());
            },
          );
        },
      ),
    );
  }
}
