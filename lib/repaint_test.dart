import 'dart:math';

import 'package:flutter/material.dart';

class RepaintTest extends StatefulWidget {
  const RepaintTest({Key? key}) : super(key: key);

  @override
  State<RepaintTest> createState() => _RepaintTestState();
}

class _RepaintTestState extends State<RepaintTest> {
  bool isRepaintActive = false;

  void onToggleRepaint(bool newVal) => setState(() => isRepaintActive = newVal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              const Text("RepaintBoundary?"),
              Switch.adaptive(
                value: isRepaintActive,
                onChanged: onToggleRepaint,
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                isRepaintActive
                    ? const RepaintBoundary(child: RotatingWidget())
                    : const RotatingWidget(),
                const StableWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RotatingWidget extends StatefulWidget {
  const RotatingWidget({Key? key}) : super(key: key);

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _animation;
  double rotation = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1);
    _animation.animate(_controller).addListener(() {
      setState(() {
        rotation = _controller.value * pi * 2;
      });
    });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: const Text("I'm spinning!"),
    );
  }
}

class StableWidget extends StatelessWidget {
  const StableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: ColoredBox(
        color: Colors.orange,
        child: Center(
          child: Text('StableWidget'),
        ),
      ),
    );
  }
}
