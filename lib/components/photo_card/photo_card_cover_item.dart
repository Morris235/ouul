import 'package:flutter/material.dart';

// TODO: 블랭크 이미지를 전달 받을수 있어야 함
class PhotoCardCoverItem extends StatefulWidget {
  const PhotoCardCoverItem({super.key});

  @override
  State<PhotoCardCoverItem> createState() => _PhotoCardCoverItemState();
}

class _PhotoCardCoverItemState extends State<PhotoCardCoverItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
