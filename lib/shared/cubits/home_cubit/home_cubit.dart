import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  int selectedIndex = 0;
  void changeIndex(int newIndex) {
    if (selectedIndex == newIndex) return;
    selectedIndex = newIndex;
    emit(NavigationChangedState());
  }

  // bool isDark = false;
  //
  // void changeThemeMode({bool? fromShared}) {
  //   if (fromShared != null) {
  //     isDark = fromShared;
  //     emit(HomeChangeThemeAppState());
  //   } else {
  //     isDark = !isDark;
  //     CacheHelper.saveData(key: 'isDark', value: isDark);
  //     emit(HomeChangeThemeAppState());
  //   }
  // }
}
