import 'package:flutter/material.dart';

// TODO: https://heewookji.github.io/2021/01/04/CustomPainter/
class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(screenSize.width * 0.05),
      height: screenSize.height * 0.25,
      width: screenSize.width,
      child: CustomPaint(
        painter: BubblePainter(),
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
