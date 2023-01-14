import 'dart:math';

import 'package:flutter/material.dart';

class PageFlipBuilder extends StatefulWidget {
  const PageFlipBuilder({
    Key? key,
    required this.frontBuilder,
    required this.backBuilder,
  }) : super(key: key);
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  PageFlipBuilderState createState() => PageFlipBuilderState();
}

class PageFlipBuilderState extends State<PageFlipBuilder>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(
      milliseconds: 500,
    ),
  );

  @override
  void initState() {
    //  implement initState
    super.initState();
    _controller.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    // implement dispose
    _controller.dispose();
    _controller.removeStatusListener(_updateStatus);
    super.dispose();
  }

  bool _showFrontSide = true;

  void flip() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() => _showFrontSide = !_showFrontSide);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: call frontBuilder or backBuilder depending on some state
    return AnimatedPageFlipBuilder(
      animation: _controller,
      frontBuilder: widget.frontBuilder,
      backBuilder: widget.frontBuilder,
    );
  }
}

class AnimatedPageFlipBuilder extends AnimatedWidget {
  const AnimatedPageFlipBuilder({
    Key? key,
    required Animation<double> animation,
    required this.frontBuilder,
    required this.backBuilder,
  }) : super(key: key, listenable: animation);
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    // this boolean tells us if we're on the first or second half of the animation
    final isAnimationFirstHalf = animation.value < 0.5;
    // decide which page we need to show
    final child =
        isAnimationFirstHalf ? frontBuilder(context) : backBuilder(context);
    // map values between [0, 1] to values between [0, pi]
    final rotationValue = animation.value * pi;
    // calculate the correct rotation angle depending on which side we need to show
    final rotationAngle =
        animation.value > 0.5 ? pi - rotationValue : rotationValue;
    // calculate tilt
    var tilt = (animation.value - 0.5).abs() - 0.5;
    // make this a small value (positive or negative as needed)
    tilt *= isAnimationFirstHalf ? -0.003 : 0.003;
    return Transform(
      transform: Matrix4.rotationY(rotationAngle)..setEntry(3, 0, tilt),
      child: child,
      alignment: Alignment.center,
    );
  }
}
