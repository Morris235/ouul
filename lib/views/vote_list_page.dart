import 'package:flutter/material.dart';
import 'package:ouul/components/vote_list_topic_item.dart';
import 'package:ouul/views/main_app_bar.dart';
import 'package:ouul/views/main_bottom_navi.dart';

class VoteListPage extends StatelessWidget {
  const VoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, idx) {
            return VoteListTopicItem(
                title: '엄빠 없을 때 혼자 뭐해? ($idx)', isVoted: idx.isOdd);
          }),
      bottomNavigationBar: const MainBottomNavi(
        currentPage: 'VoteListPage',
        pageIndex: 1,
      ),
    );
  }
}
