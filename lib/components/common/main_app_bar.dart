import 'package:flutter/material.dart';
import 'package:ouul/pages/photo_card_%20creation_page.dart';
import 'package:ouul/pages/photo_card_appeal_page.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  static const List<String> dropDownValues = ['포토카드 제작'];
  String selectedValue = '포토카드 제작';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            // FIXME: 스택이 끝까지 도달하면 blank screen이 뜬다.
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back)),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          tooltip: '검색',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
          tooltip: '알림',
        ),
        PopupMenuButton<String>(
            icon: const Icon(
              Icons.list_outlined,
              color: Colors.black,
            ),
            offset: const Offset(0, 55),
            elevation: 2,
            color: Colors.white,
            onSelected: (value) {
              switch (value) {
                case 'photoCard':
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PhotoCardCreationPage(),
                    ),
                  );
                  break;
                case 'photoCardGallery':
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PhotoCardAppealPage(),
                    ),
                  );
                  break;
              }
            },
            itemBuilder: ((context) => [
                  PopupMenuItem(
                      value: 'photoCard',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.pets_outlined,
                            color: Colors.black,
                          ),
                          Text('포토카드')
                        ],
                      )),
                  PopupMenuItem(
                      value: 'photoCardGallery',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.view_list_outlined,
                            color: Colors.black,
                          ),
                          Text('포토카드 갤러리')
                        ],
                      ))
                ])),
      ],
    );
  }
}
