import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild SettingsScreen");
    return const Center(
      child: Text('This is settings Screen'),
    );
    ;
  }
}
