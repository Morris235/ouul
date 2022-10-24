import 'package:flutter/material.dart';
import 'package:ouul/components/vote_list_topic_item.dart';

class VoteListPage extends StatelessWidget {
  const VoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 300,
            itemBuilder: (context, idx) {
              return VoteListTopicItem(
                  title: '엄빠 없을 때 혼자 뭐해? ($idx)', isVoted: idx.isOdd);
            }));
  }
}
