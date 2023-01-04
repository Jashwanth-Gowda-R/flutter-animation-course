import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';

import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  // const StopWatchRenderer({super.key});
  const StopWatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);
  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.orange),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        ElapsedTimeText(
          elapsed: elapsed,
        ),
      ],
    );
  }
}
