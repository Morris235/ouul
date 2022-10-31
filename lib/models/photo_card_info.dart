import 'package:flutter/material.dart';

class PhotoCardInfo {
  String name;
  Color color;
  String imgUrl;
  String charmPoint;
  String hobby;
  int currentCard;

  PhotoCardInfo(
      {this.name = '',
      this.color = Colors.white,
      this.imgUrl = '',
      this.charmPoint = '',
      this.hobby = '',
      this.currentCard = 0});
}
