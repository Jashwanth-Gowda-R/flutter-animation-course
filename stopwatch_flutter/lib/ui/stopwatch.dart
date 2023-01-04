import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  // late DateTime _initialTime;
  // late final Timer _timer;
  late final Ticker _ticker;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    // _initialTime = DateTime.now();
    // _timer = Timer.periodic(Duration(milliseconds: 50), (_) {
    //   final now = DateTime.now();
    //   setState(() {
    //     _elapsed = now.difference(_initialTime);
    //   });
    // });
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    //  implement dispose
    // _timer.cancel();
    _ticker.dispose();
    super.dispose();
  }

  // don't forget to cancel the timer on dispose!
  @override
  Widget build(BuildContext context) {
    return StopWatchRenderer(
      elapsed: _elapsed,
    );
  }
}
