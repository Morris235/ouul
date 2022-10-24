import 'package:flutter/material.dart';
import 'package:ouul/views/feed_page.dart';
import 'package:ouul/views/my_page.dart';
import 'package:ouul/views/vote_list_page.dart';
import 'home_page.dart';

class MainBottomNavi extends StatefulWidget implements PreferredSizeWidget {
  const MainBottomNavi(
      {super.key, required this.currentPage, required this.pageIndex});
  final String currentPage;
  final int pageIndex;
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<MainBottomNavi> createState() => _MainBottomNaviState();
}

class _MainBottomNaviState extends State<MainBottomNavi> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.pageIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            label: 'Now',
            icon: IconButton(
                onPressed: () {
                  if (widget.currentPage != 'HomePage') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.home_outlined))),
        BottomNavigationBarItem(
          label: '투표',
          icon: IconButton(
            onPressed: () {
              if (widget.currentPage != 'VoteListPage') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VoteListPage(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.how_to_vote_outlined),
          ),
        ),
        BottomNavigationBarItem(
          label: '피드',
          icon: IconButton(
            onPressed: () {
              if (widget.currentPage != 'FeedPage') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FeedPage(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.how_to_vote_outlined),
          ),
        ),
        BottomNavigationBarItem(
          label: '마이페이지',
          icon: IconButton(
            onPressed: () {
              if (widget.currentPage != 'MyPage') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyPage(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.how_to_vote_outlined),
          ),
        )
      ],
    );
  }
}
