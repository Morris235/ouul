import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //뒤로가기
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back)),
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
