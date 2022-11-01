import 'package:flutter/material.dart';
import 'package:ouul/models/photo_card_info.dart';

class PhotoCardAppealItem extends StatefulWidget {
  const PhotoCardAppealItem(
      {super.key, required this.selectedCardColor, required this.cardInfo});
  final Color selectedCardColor;
  final PhotoCardInfo cardInfo;

  @override
  State<PhotoCardAppealItem> createState() => _PhotoCardAppealItemState();
}

class _PhotoCardAppealItemState extends State<PhotoCardAppealItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
            width: 300,
            height: 420,
            child: Column(
              children: [
                Expanded(
                  child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      color: widget.cardInfo.color,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '콜리',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          Text(
                            widget.cardInfo.charmPoint,
                            style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          // SizedBox(
                          //   width: 150,
                          //   height: 150,
                          //   child: FadeInImage.assetNetwork(
                          //     placeholder: 'assets/images/Spinner-1s-200px.gif',
                          //     image: widget.cardInfo.imgUrl,
                          //     imageErrorBuilder: (context, error, stackTrace) => ,
                          //   ),
                          // ),
                          const Icon(
                            Icons.photo_camera_outlined,
                            size: 50,
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.cardInfo.hobby,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                )
              ],
            )));
  }
}
