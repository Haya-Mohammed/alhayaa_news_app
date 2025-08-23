import 'package:alhayaa_news_app/bloc_observer.dart';
import 'package:alhayaa_news_app/home_page.dart';
import 'package:alhayaa_news_app/network/local/cache_helper.dart';
import 'package:alhayaa_news_app/network/remote/dio_helper.dart';
import 'package:alhayaa_news_app/shared/constants/app_strings.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/shared/cubits/news_cubit/news_cubit.dart';
import 'package:alhayaa_news_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  final bool? isDark = await CacheHelper.getData(key: 'isDark');
  runApp(
    MyApp(
      isDark: isDark,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => NewsCubit()..getNews()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: isDark == true ? ThemeMode.dark : ThemeMode.light,
        // home: const FeedsScreen(),
        home: HomePage(),
      ),
    );
  }
}
