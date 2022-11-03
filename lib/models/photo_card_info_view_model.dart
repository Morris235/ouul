import 'package:flutter/material.dart';

class PhotoCardInfoViewModel with ChangeNotifier {
  String name;
  Color color;
  String imgUrl;
  String charmPoint;
  String hobby;
  int currentCard;

  // TODO: 서버로부터 비동기적으로 데이터를 받았다고 가정함
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

  static const List<String> charmPointList = [
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
    '터그놀이를 좋아하는',
    '달리는걸 좋아하는',
    '고양이를 좋아하는',
    '물놀이를 좋아하는',
    '사람을 좋아하는',
    '자는걸 좋아하는',
    '식빵을 좋아하는',
    '풀냄새를 좋아하는',
    '사료를 좋아하는',
    '바나나 좋아하는',
    '막대기를 좋아하는',
    '장난을 좋아하는',
    '하울링을 좋아하는',
  ];

  PhotoCardInfoViewModel(
      {this.name = '',
      this.color = Colors.white,
      this.imgUrl = '',
      this.charmPoint = '',
      this.hobby = '',
      this.currentCard = 0});
}
