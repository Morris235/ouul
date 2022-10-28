import 'package:flutter/material.dart';
import 'package:ouul/components/photo_card_item.dart';
import 'package:ouul/views/main_app_bar.dart';

import '../models/card_info.dart';

class PhotoCardAppealPage extends StatefulWidget {
  const PhotoCardAppealPage({super.key});

  @override
  State<PhotoCardAppealPage> createState() => _PhotoCardAppealPageState();
}

class _PhotoCardAppealPageState extends State<PhotoCardAppealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: PageView.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return PhotoCardItem(
                selectedCardColor: Colors.yellow,
                cardInfo: CardInfo('멍멍이', Colors.red),
              );
            })));
  }
}
