import 'package:alhayaa_news_app/core/widgets/app_bottom_navbar.dart';
import 'package:alhayaa_news_app/viewmodels/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/viewmodels/home_cubit/home_state.dart';
import 'package:alhayaa_news_app/views/explore_screen.dart';
import 'package:alhayaa_news_app/views/feeds_screen.dart';
import 'package:alhayaa_news_app/views/saved_screen.dart';
import 'package:alhayaa_news_app/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Widget> pages = const [
    FeedsScreen(),
    ExploreScreen(),
    SavedScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);

        return Scaffold(
          body: IndexedStack(
            index: cubit.selectedIndex,
            children: pages,
          ),
          bottomNavigationBar: AppBottomNavBar(
            currentIndex: cubit.selectedIndex,
            onTap: (index) => cubit.changeIndex(index),
          ),
        );
      },
    );
  }
}
