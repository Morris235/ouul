import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ouul/components/photo_card/photo_card_appeal_item.dart';

import '../models/photo_card_info_view_model.dart';

class PhotoCardAppealPage extends StatefulWidget {
  const PhotoCardAppealPage({super.key});

  @override
  State<PhotoCardAppealPage> createState() => _PhotoCardAppealPageState();
}

class _PhotoCardAppealPageState extends State<PhotoCardAppealPage>
    with TickerProviderStateMixin {
  double _currentCardListViewIdx = 0.0;
  int _selectedCardIndex = 1000;
  int _currentHobby = 0;
  late final AnimationController _rotationAnimationController =
      AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _rotationAnimation = CurvedAnimation(
    parent: _rotationAnimationController,
    curve: Curves.elasticOut,
  );

  late CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  bool _autoSlideActive = true;
  bool _visiable = false;
  final ScrollController _scrollController = ScrollController();
  final double _height = 600;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(microseconds: 26000), (Timer timer) {
      double autoScrollProgress = timer.tick * 1.0;
      if (_scrollController.hasClients &&
          _autoSlideActive &&
          autoScrollProgress < _scrollController.position.maxScrollExtent) {
        _scrollController.animateTo(autoScrollProgress,
            duration: Duration(microseconds: timer.tick),
            curve: Curves.easeOutSine);
      }
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _visiable = true;
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _crossFadeState = CrossFadeState.showSecond;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _rotationAnimationController.dispose();
    super.dispose();
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
        // appBar: const MainAppBar(),
        body: Container(
      margin: const EdgeInsets.all(1.0),
      padding: const EdgeInsets.all(1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO: 툴팁
          const SizedBox(
            height: 80,
          ),
          const Tooltip(
            message: '카드를 터치하면 프로필을 볼 수 있어요',
          ),
          Container(
              width: double.maxFinite,
              height: 550,
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.all(1.0),
              // 포토 카드 리스트
              child: GestureDetector(
                onTap: () => {_autoSlideActive = false},
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: colorList.length,
                    itemBuilder: ((context, index) {
                      _currentCardListViewIdx = index * 1.0;
                      // TODO: 여기서 카드 아이템을 클릭하면 해당 카드 아이템만 뒷면 위젯을 보여야함 (사이즈업, 상하 반동정지)
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCardIndex = index;
                            });
                          },
                          child: PhotoCardAppealItem(
                            cardInfo: PhotoCardInfoViewModel(
                                color: colorList[index],
                                imgUrl:
                                    'https://picsum.photos/250?image=$index',
                                charmPoint: charmPoint[index],
                                hobby: hobbyList[index],
                                currentCard: _currentCardListViewIdx),
                            cardIndex: index,
                            selectedCardIndex: _selectedCardIndex,
                          ));
                    })),
              )),
          const SizedBox(
            height: 30,
          ),
          // 하단 친구 카테고리및 회원 가입버튼
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: _visiable ? 1.0 : 0.0,
            child: AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    const Text(
                      'OUUL',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      "너도 포카 꾸밀래?",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "우린 포카로 인사해",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RotationTransition(
                          turns: _rotationAnimation,
                          child: const Text(
                            "\u{1F44B}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                secondChild: Column(
                  children: [
                    SizedBox(
                        height: 60,
                        width: double.maxFinite,
                        child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hobbyList.length,
                            controller: PageController(
                                initialPage: 0, viewportFraction: 0.45),
                            onPageChanged: (value) {
                              setState(() {
                                _currentHobby = value;
                              });
                            },
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: double.maxFinite,
                                      padding: const EdgeInsets.all(2.0),
                                      margin: const EdgeInsets.all(2.0),
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: _currentHobby == index
                                                ? 1.0
                                                : 0.0,
                                            child: const Text('\u{1F340}'),
                                          ),
                                          Text(
                                            hobbyList[index],
                                            style: const TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ))));
                            }))),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 62,
                      child: ElevatedButton(
                          onPressed: () => {
                                Get.bottomSheet(
                                  Container(
                                      height: 200,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            '시작하기',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                              width: double.maxFinite,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          'assets/images/apple_login.png')),
                                                  SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          'assets/images/google_login.png')),
                                                  SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          'assets/images/instargram_login.png')),
                                                  SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          'assets/images/naver_login.png')),
                                                  SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          'assets/images/kakao_login.png'))
                                                ],
                                              )),
                                        ],
                                      )),
                                ),
                              },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => const Color(0xff212121)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
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
                    ),
                  ],
                ),
                crossFadeState: _crossFadeState,
                firstCurve: Curves.elasticIn,
                secondCurve: Curves.elasticIn,
                duration: const Duration(seconds: 1)),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    ));
  }
}
