import 'package:flutter/material.dart';
import 'package:ouul/components/photo_card/photo_card_appeal_item.dart';
import 'package:ouul/views/main_app_bar.dart';

import '../models/photo_card_info.dart';

class PhotoCardAppealPage extends StatefulWidget {
  const PhotoCardAppealPage({super.key});

  @override
  State<PhotoCardAppealPage> createState() => _PhotoCardAppealPageState();
}

// TODO: 툴팁, 카드 하이라이팅+아래 텍스트 볼드 표시(이것도 슬라이드),
// TODO: 클릭하면 카드의 뒷면을 보여주는 애니메이션, 카드의 구멍을 뚫고 그 안에 이미지 보여주기
// 결국 커스텀 페인트와 애니메이션인가
class _PhotoCardAppealPageState extends State<PhotoCardAppealPage> {
  static const List<Color> colorList = [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 243, 191, 33),
    Color.fromARGB(255, 255, 59, 203),
    Color.fromARGB(255, 59, 248, 255),
    Color.fromARGB(255, 59, 85, 255),
    Color.fromARGB(150, 65, 59, 255),
    Color.fromARGB(255, 59, 255, 203),
    Color.fromARGB(255, 255, 239, 59),
    Color.fromARGB(255, 59, 206, 255),
    Color.fromARGB(255, 114, 59, 255),
    Color.fromARGB(255, 59, 59, 255),
  ];

  static const List<String> charmPoint = [
    '해맑고 새초롬한',
    '순둥순둥하고 섬세한',
    '둥글한',
    '섬세한',
    '매력있는',
    '에너지 넘치는',
    '성실한',
    '한가한',
    '게으른',
    '시니컬한',
    '순진한'
  ];

  static const List<String> hobbyList = [
    '산책을 좋아하는',
    '짖는걸 좋아하는',
    '장난감을 좋아하는',
    '터그놀이를 좋아하는',
    '달리는걸 좋아하는',
    '고양이를 좋아하는',
    '물놀이를 좋아하는',
    '사람을 좋아하는',
    '자는걸 좋아하는',
    '식빵을 좋아하는',
    '풀냄새를 좋아하는'
  ];

  int _currentCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: Container(
          margin: const EdgeInsets.all(1.0),
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Tooltip(
                message: '카드를 터치하면 프로필을 볼 수 있어요',
              ),
              Container(
                  width: double.maxFinite,
                  height: 450,
                  margin: const EdgeInsets.all(1.0),
                  padding: const EdgeInsets.all(1.0),
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          _currentCard = value;
                        });
                      },
                      controller: PageController(
                          initialPage: 0, viewportFraction: 0.70),
                      itemCount: colorList.length,
                      itemBuilder: ((context, index) {
                        return PhotoCardAppealItem(
                          selectedCardColor: Colors.yellow,
                          cardInfo: PhotoCardInfo(
                              color: colorList[index],
                              imgUrl: 'https://picsum.photos/250?image=$index',
                              charmPoint: charmPoint[index],
                              hobby: hobbyList[index],
                              currentCard: _currentCard),
                        );
                      }))),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: OutlinedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => const Color(0xff212121)),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26)))),
                    child: Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(1.0),
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '아울 친구들과 함께 놀아요',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Noto_Sans_KR',
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
