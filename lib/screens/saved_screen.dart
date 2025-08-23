import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild SavedScreen");
    return const Center(
      child: Text('No Saved Articles yet!'),
    );
  }
}
