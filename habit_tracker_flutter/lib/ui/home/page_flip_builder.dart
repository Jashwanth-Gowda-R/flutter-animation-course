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
    return widget.frontBuilder(context);
  }
}
