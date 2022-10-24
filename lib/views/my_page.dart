import 'package:flutter/material.dart';

import 'main_app_bar.dart';
import 'main_bottom_navi.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: Center(child: Text('마이 페이지')),
      bottomNavigationBar: MainBottomNavi(
        currentPage: 'MyPage',
        pageIndex: 3,
      ),
    );
  }
}
