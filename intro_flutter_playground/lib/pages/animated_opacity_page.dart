import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  createState() => AnimatedOpacityPageState();
}

class AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  var opacity = 1.0;

  // var random = Random();
  void _toggleOpacity() {
    setState(() {
      // opacity = random.nextDouble();
      opacity = opacity == 0 ? 1.0 : 0;
      print(opacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: 200),
            ),
            ElevatedButton(
              child: Text('Fade Logo'),
              //  Implement
              onPressed: _toggleOpacity,
            ),
          ],
        ),
      ),
    );
  }
}
