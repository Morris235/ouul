import 'package:flutter/material.dart';

import '../components/common/main_app_bar.dart';
import 'package:ouul/components/common/main_bottom_navi.dart';

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
