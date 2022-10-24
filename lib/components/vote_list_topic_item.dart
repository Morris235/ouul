import 'package:flutter/material.dart';

class VoteListTopicItem extends StatelessWidget {
  const VoteListTopicItem(
      {super.key, required this.title, required this.isVoted});

  final String title;
  final bool isVoted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 359,
          height: 113,
          margin: const EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: const Color(0xffBDBDBD))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)),
                      child: const Center(
                          child: Text(
                        'D-1',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ))),
                  const SizedBox(width: 15),
                  const Text(
                    '2022-01-01 ~ 2022-02-02',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  _votedBadge()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Noto_Sans_KR',
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('assets/images/paws2.png'),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('1,230마리가 답변 중')
                ],
              ),
            ],
          )),
    );
  }

  Widget _votedBadge() {
    return isVoted
        ? Container(
            width: 60,
            height: 23,
            decoration: BoxDecoration(
                color: const Color(0xffE0E0E0),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: const Color(0xffE0E0E0))),
            child: const Center(
              child: Text(
                '참여 완료',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Noto_Sans_KR',
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ))
        : const SizedBox();
  }
}
