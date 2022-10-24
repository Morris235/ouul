import 'package:flutter/material.dart';
import 'package:ouul/views/main_app_bar.dart';
import 'package:ouul/views/main_bottom_navi.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: Center(child: Text('피드 페이지')),
      bottomNavigationBar: MainBottomNavi(
        currentPage: 'FeedPage',
        pageIndex: 2,
      ),
    );
  }
}
