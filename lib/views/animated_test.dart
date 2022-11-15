import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedTest extends StatefulWidget {
  const AnimatedTest({super.key});

  @override
  State<AnimatedTest> createState() => _AnimatedTestState();
}

class _AnimatedTestState extends State<AnimatedTest>
    with TickerProviderStateMixin {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  // Using `late final` for [lazy initialization](https://dart.dev/null-safety/understanding-null-safety#lazy-initialization).
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.center,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('애니메이션 테스트'),
      ),
      body: Center(
        child: AlignTransition(
          alignment: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: AnimatedContainer(
              // Use the properties stored in the State class.
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                border: Border.all(color: Colors.black),
                borderRadius: _borderRadius,
              ),
              // Define how long the animation should take.
              duration: const Duration(seconds: 1),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user taps the button
        onPressed: () {
          // Use setState to rebuild the widget with new values.
          setState(() {
            // Create a random number generator.
            final random = Random();

            // Generate a random width and height.
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            // Generate a random color.
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            // Generate a random border radius.
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
