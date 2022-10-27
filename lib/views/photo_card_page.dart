import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ouul/views/main_app_bar.dart';

import '../components/photo_card_item.dart';

class PhotoCardPage extends StatefulWidget {
  const PhotoCardPage({super.key});

  @override
  State<PhotoCardPage> createState() => _PhotoCardPageState();
}

class _PhotoCardPageState extends State<PhotoCardPage> {
  int _selectedColorIconIdx = 0;
  Color _selectedCardColor = colorList[0];
  String _selectedAnimal = 'dog';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '친구들에게 뽐낼\n포토카드를 만들어 볼까요',
                      style: TextStyle(
                        fontFamily: 'Noto_Sans_KR',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 17,
                        height: 1.5,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedAnimal = 'dog';
                              });
                            },
                            child: Icon(
                              _selectedAnimal == 'dog'
                                  ? Icons.check_circle_outline
                                  : Icons.circle_outlined,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedAnimal = 'cat';
                              });
                            },
                            child: Icon(
                              _selectedAnimal == 'cat'
                                  ? Icons.check_circle_outline
                                  : Icons.circle_outlined,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            indent: 25,
                            endIndent: 25,
                            color: Colors.black,
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 100,
                              width: double.maxFinite,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(2),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: colorList.length,
                                  dragStartBehavior: DragStartBehavior.start,
                                  itemBuilder: (context, idx) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedColorIconIdx = idx;
                                          _selectedCardColor = colorList[idx];
                                        });
                                      },
                                      child: Icon(
                                        _selectedColorIconIdx == idx
                                            ? Icons.check_circle_rounded
                                            : Icons.circle_rounded,
                                        size: 50,
                                        color: colorList[idx],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    PhotoCardItem(selectedCardColor: _selectedCardColor)
                  ]),
            )));
  }
}
