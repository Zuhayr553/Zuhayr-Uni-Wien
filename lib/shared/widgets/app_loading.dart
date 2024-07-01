import 'package:flutter/material.dart';
import 'widgets.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class PreloadBackgroundPainter extends CustomPainter {
  PreloadBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var rect = Offset.zero & size;
    paint.shader = AppStyle.backgroundGradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
