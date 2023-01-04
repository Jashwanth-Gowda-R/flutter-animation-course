import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  // const StopWatchRenderer({super.key});
  const StopWatchRenderer({
    Key? key,
    required this.elapsed,
  }) : super(key: key);
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(
      elapsed: elapsed,
    );
  }
}
