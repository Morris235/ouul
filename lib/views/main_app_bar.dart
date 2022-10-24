import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          tooltip: '',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
          tooltip: '',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.list_outlined,
            color: Colors.black,
          ),
          tooltip: '',
        ),
      ],
    );
  }
}
