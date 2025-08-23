import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext ctx;
  const CustomAppBar({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Alhaya News'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MediaQuery.of(ctx).size.height);
}
