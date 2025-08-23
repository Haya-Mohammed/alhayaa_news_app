import 'package:alhayaa_news_app/widgets/category_list_item.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final List<String> categories = [
    'All',
    'Sports',
    'Education',
    'Business',
    'Entertainment',
    'Politic',
    'Health',
    'Science',
    'Technology',
  ];

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => CategoryListItem(
          name: categories[index],
        ),
      ),
    );
  }
}
