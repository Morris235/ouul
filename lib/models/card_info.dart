import 'package:flutter/material.dart';

class CardInfo {
  CardInfo(this._name, this._color);
  final String _name;
  final Color _color;

  getName() {
    return _name;
  }

  getColor() {
    return _color;
  }
}
