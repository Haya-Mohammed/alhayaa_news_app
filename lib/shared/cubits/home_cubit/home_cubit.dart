import 'package:alhayaa_news_app/network/local/cache_helper.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(bool? fromCache) : super(HomeInitialState()) {
    isDark = fromCache ?? false;
  }

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  int selectedIndex = 0;
  void changeIndex(int newIndex) {
    if (selectedIndex == newIndex) return;
    selectedIndex = newIndex;
    emit(NavigationChangedState());
  }

  /// Dark mode
  late bool isDark;

  void changeTheme({bool? fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark);
    }
    emit(ChangeThemeAppState());
  }
}
