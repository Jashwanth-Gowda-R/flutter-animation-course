import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/tasks/task_completion_ring.dart';

class AnimatedTask extends StatefulWidget {
  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    // implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return TaskCompletionRing(
          progress: _animationController.value,
        );
      },
    );
  }
}
