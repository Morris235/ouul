import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouul/components/main_app_bar.dart';
import 'package:ouul/components/main_bottom_navi.dart';
import 'package:ouul/views/animated_test.dart';
import 'package:ouul/views/animated_test_text.dart';
import 'package:ouul/views/photo_card_%20creation_page.dart';
import 'package:ouul/views/photo_card_appeal_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(const PhotoCardCreationPage());
                  },
                  child: const Text(
                    '포토카드 생성',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(const PhotoCardAppealPage());
                  },
                  child: const Text(
                    '진입스크린',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(const AnimatedTest());
                  },
                  child: const Text(
                    '애니메이션 도형 테스트',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(const AnimatedTestText());
                  },
                  child: const Text(
                    '애니메이션 글자 테스트',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MainBottomNavi(
        currentPage: 'HomePage',
        pageIndex: 0,
      ),
    );
  }
}
