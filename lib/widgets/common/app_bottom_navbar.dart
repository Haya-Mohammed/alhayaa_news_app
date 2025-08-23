import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return BottomNavigationBar(
          currentIndex: HomeCubit.get(context).selectedIndex,
          onTap: (value) => cubit.changeIndex(value),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.travel_explore), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          ],
        );
      },
    );
  }
}
