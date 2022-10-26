import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ouul/views/main_app_bar.dart';

class PhotoCardPage extends StatefulWidget {
  const PhotoCardPage({super.key});

  @override
  State<PhotoCardPage> createState() => _PhotoCardPageState();
}

class _PhotoCardPageState extends State<PhotoCardPage> {
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
              child: Column(children: [
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
                SizedBox(
                  height: 100,
                  width: double.maxFinite,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    dragStartBehavior: DragStartBehavior.start,
                    children: const <Widget>[
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Colors.purple,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Color.fromARGB(255, 233, 30, 132),
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Color.fromARGB(255, 59, 134, 255),
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Color.fromARGB(255, 248, 59, 255),
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Color.fromARGB(255, 255, 180, 59),
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Colors.indigoAccent,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 50,
                        color: Colors.cyanAccent,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  width: 300,
                  height: 400,
                  child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          // TextField(),
                          Icon(Icons.photo_camera_outlined)
                        ],
                      )),
                )
              ]),
            )));
  }
}
