import 'package:flutter/widgets.dart';
import 'package:uni_wien_zuhayr_test/configs/theme/app_styles.dart';

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
