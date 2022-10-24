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
      onTap: (value) {
        switch (value) {
          case 0:
            if (widget.currentPage != 'HomePage') {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            }
            break;
          case 1:
            if (widget.currentPage != 'VoteListPage') {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VoteListPage(),
                ),
              );
            }
            break;
          case 2:
            if (widget.currentPage != 'FeedPage') {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FeedPage(),
                ),
              );
            }
            break;
          case 3:
            if (widget.currentPage != 'MyPage') {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyPage(),
                ),
              );
            }
            break;
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(label: 'Now', icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(
            label: '투표', icon: Icon(Icons.how_to_vote_outlined)),
        BottomNavigationBarItem(label: '피드', icon: Icon(Icons.star_outline)),
        BottomNavigationBarItem(
            label: '마이페이지', icon: Icon(Icons.person_2_outlined))
      ],
    );
  }
}
