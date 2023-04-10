import 'package:flutter/material.dart';

class SimulationScreen extends StatefulWidget {
  const SimulationScreen({
    Key? key,
  }) : super(key: key);
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FadeTransition(
          opacity: Tween(begin: 1.0, end: 0.0).animate(
            controller.drive(CurveTween(curve: Curves.linear)),
          ),
          child: const Placeholder(
              fallbackHeight: 300, fallbackWidth: double.infinity),
        ),
        FadeTransition(
          opacity: controller.drive(CurveTween(curve: Curves.linear)),
          child: const Placeholder(
              fallbackHeight: 300, fallbackWidth: double.infinity),
        ),
        FloatingActionButton(
          onPressed: () {
            controller.repeat();
          },
        ),
      ],
    );
  }
}
