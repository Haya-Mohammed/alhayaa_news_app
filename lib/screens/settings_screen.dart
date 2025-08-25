import 'package:alhayaa_news_app/shared/constants/app_colors.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:alhayaa_news_app/shared/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = HomeCubit.get(context);
              return SwitchListTile(
                title: Text(
                  "Dark Theme",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                secondary: const Icon(Icons.brightness_6),
                value: cubit.isDark,
                onChanged: (value) {
                  cubit.changeTheme();
                },
                activeColor: AppColors.secondary,
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.cardColor,
                inactiveThumbColor: AppColors.secondary,
              );
            },
          ),
          const Divider(),
          // Todo: Localization
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(
              "Language",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: const Text("English"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
