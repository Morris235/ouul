import 'package:flutter/material.dart';
import 'package:ouul/models/photo_card_info_view_model.dart';

class PhotoCardItem extends StatefulWidget {
  const PhotoCardItem(
      {super.key, required this.selectedCardColor, required this.cardInfo});
  final Color selectedCardColor;
  final PhotoCardInfoViewModel cardInfo;

  @override
  State<PhotoCardItem> createState() => _PhotoCardItemState();
}

class _PhotoCardItemState extends State<PhotoCardItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 300,
      height: 400,
      child: Card(
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          color: widget.cardInfo.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 160,
                      height: 120,
                      child: TextField(
                        cursorWidth: 3,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hintText: '내 이름은',
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TODO: 네트워크 이미지를 가져올때 에러 핸들링
              // SizedBox(
              //   width: 150,
              //   height: 150,
              //   child: Image.network(widget.cardInfo.getImgUrl()),
              // ),
              const Icon(
                Icons.photo_camera_outlined,
                size: 50,
              )
            ],
          )),
    ));
  }
}
