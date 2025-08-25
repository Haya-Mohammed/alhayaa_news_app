import 'package:alhayaa_news_app/bloc_observer.dart';
import 'package:alhayaa_news_app/home_page.dart';
import 'package:alhayaa_news_app/network/local/cache_helper.dart';
import 'package:alhayaa_news_app/network/remote/dio_helper.dart';
import 'package:alhayaa_news_app/shared/constants/app_strings.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:alhayaa_news_app/shared/cubits/news_cubit/news_cubit.dart';
import 'package:alhayaa_news_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  final bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark: isDark));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(isDark)),
        BlocProvider(create: (context) => NewsCubit()..getNews()),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
