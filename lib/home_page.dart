import 'package:alhayaa_news_app/screens/explore_screen.dart';
import 'package:alhayaa_news_app/screens/feeds_screen.dart';
import 'package:alhayaa_news_app/screens/saved_screen.dart';
import 'package:alhayaa_news_app/screens/settings_screen.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:alhayaa_news_app/widgets/common/app_bottom_navbar.dart';
import 'package:alhayaa_news_app/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(ctx: context),
          body: IndexedStack(
            index: HomeCubit.get(context).selectedIndex,
            children: [
              FeedsScreen(),
              ExploreScreen(),
              SavedScreen(),
              SettingsScreen(),
            ],
          ),
          bottomNavigationBar: AppBottomNavBar(),
        );
      },
    );
  }
}
