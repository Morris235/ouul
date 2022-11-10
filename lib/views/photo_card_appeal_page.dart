import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ouul/components/photo_card/photo_card_appeal_item.dart';
import 'package:ouul/components/main_app_bar.dart';

import '../models/photo_card_info_view_model.dart';

class PhotoCardAppealPage extends StatefulWidget {
  const PhotoCardAppealPage({super.key});

  @override
  State<PhotoCardAppealPage> createState() => _PhotoCardAppealPageState();
}

class _PhotoCardAppealPageState extends State<PhotoCardAppealPage> {
  double _currentListViewIdx = 0.0;
  final ScrollController _scrollController = ScrollController();
  double _width = 600;
  double _height = 600;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  bool active = true;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(microseconds: 25000), (Timer timer) {
      if (_scrollController.hasClients) {
        if (timer.tick * 1.0 < _scrollController.position.maxScrollExtent &&
            active) {
          print(timer.tick * 1.0);
          print(active);
          print(_scrollController.position.maxScrollExtent);
          _scrollController.animateTo(timer.tick * 1.0,
              duration: const Duration(microseconds: 25000),
              curve: Curves.easeOutSine);
        }
      }
    });
  }

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
    Color.fromARGB(255, 10, 149, 126),
    Color.fromARGB(255, 115, 55, 70),
    Color.fromARGB(255, 167, 58, 177),
    Color.fromARGB(255, 202, 174, 72),
    Color.fromARGB(255, 116, 48, 48),
    Color.fromARGB(255, 255, 213, 237),
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
    '순진한',
    '푸근한',
    '야무진',
    '소심한',
    '엉뚱한',
    '훌륭한',
  ];

  static const List<String> hobbyList = [
    '산책을 좋아하는',
    '짖는걸 좋아하는',
    '장난감을 좋아하는',
    '터그를 좋아하는',
    '달리는걸 좋아하는',
    '고양이를 좋아하는',
    '물놀이를 좋아하는',
    '사람을 좋아하는',
    '잠을 좋아하는',
    '식빵을 좋아하는',
    '풀냄새를 좋아하는',
    '사료를 좋아하는',
    '바나나 좋아하는',
    '막대기를 좋아하는',
    '장난을 좋아하는',
    '하울링을 좋아하는',
  ];

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
                  child: GestureDetector(
                    onTap: () => active = false,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        itemCount: colorList.length,
                        itemBuilder: ((context, index) {
                          _currentListViewIdx = index * 1.0;
                          return SizedBox(
                              child: AnimatedContainer(
                            // Use the properties stored in the State class.
                            width: 300,
                            height: _height,
                            // decoration: BoxDecoration(
                            //   color: _color,
                            //   borderRadius: _borderRadius,
                            // ),
                            // Define how long the animation should take.
                            duration: const Duration(seconds: 1),
                            // Provide an optional curve to make the animation feel smoother.
                            curve: Curves.fastOutSlowIn,
                            child: PhotoCardAppealItem(
                              selectedCardColor: Colors.yellow,
                              cardInfo: PhotoCardInfoViewModel(
                                  color: colorList[index],
                                  imgUrl:
                                      'https://picsum.photos/250?image=$index',
                                  charmPoint: charmPoint[index],
                                  hobby: hobbyList[index],
                                  currentCard: _currentListViewIdx),
                            ),
                          ));
                        })),
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hobbyList.length,
                      controller: PageController(
                          initialPage: 0, viewportFraction: 0.45),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(2.0),
                                margin: const EdgeInsets.all(2.0),
                                child: Center(
                                  child: Text(
                                    hobbyList[index],
                                    style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )));
                      }))),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 62,
                child: OutlinedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => const Color(0xff212121)),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
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
