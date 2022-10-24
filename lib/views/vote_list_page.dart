import 'package:flutter/material.dart';
import 'package:ouul/components/vote_list_topic_item.dart';
import 'package:ouul/views/main_app_bar.dart';
import 'package:ouul/views/main_bottom_navi.dart';

class VoteListPage extends StatelessWidget {
  const VoteListPage({super.key});
  static const List<String> dropDownValues = ['종료 임박 순', '최근 시작된 순', '참여 많은 순'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                items: dropDownValues
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: ((value) => {}),
                value: dropDownValues[0],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, idx) {
                  return VoteListTopicItem(
                      title: '엄빠 없을 때 혼자 뭐해? ($idx)', isVoted: idx.isOdd);
                }),
          )
        ],
      ),
      bottomNavigationBar: const MainBottomNavi(
        currentPage: 'VoteListPage',
        pageIndex: 1,
      ),
    );
  }
}
