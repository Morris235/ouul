import 'package:flutter/material.dart';
import 'package:ouul/components/common/main_app_bar.dart';
import 'package:ouul/components/common/main_bottom_navi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Text('홈 페이지'),
      ),
      bottomNavigationBar: MainBottomNavi(
        currentPage: 'HomePage',
        pageIndex: 0,
      ),
    );
  }
}
