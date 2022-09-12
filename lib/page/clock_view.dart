import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  //static const String routeName = '/clock_view';
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {

      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final dateTime=DateTime.now();



  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var fillBrush = Paint()..color = const Color(0xFF444974);
    var outLineBrush = Paint()
      ..color = const Color(0xFFeaecff)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;
    var centerBrush = Paint()..color = const Color(0xFFeaecff);
    var secHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.orange[300]!
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    var minHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader =
          const RadialGradient(colors: [Color(0xFF748EF6), Color(0xff77ddff)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange[300]!
      ..strokeWidth = 11
      ..style = PaintingStyle.stroke;
    var hourHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader =
          const RadialGradient(colors: [Color(0xffea74ab), Color(0xffc279fb)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange[300]!
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke;
    var secHandX = centerX + 70 * cos(dateTime.second*6 * pi / 180);
    var secHandY = centerX + 70 * sin(dateTime.second*6 * pi / 180);

    var minHandY = centerY + 70 * sin(dateTime.minute*6 * pi / 180);
    var minHandX = centerX+ 70 * cos(dateTime.minute*6 * pi / 180);

    var hourHandX = centerX + 50 * cos((dateTime.hour*30+dateTime.minute*0.5) * pi / 180);
    var hourHandY = centerX + 50 * sin((dateTime.hour*30+dateTime.minute*0.5) * pi / 180);


    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outLineBrush);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    canvas.drawCircle(center, 16, centerBrush);

    var outBrush = Paint()
      ..color = const Color(0xFFeaecff)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final oterCircle=radius;
    final innerCircle=radius-14;
    for(int i=0;i<360;i+=12){
      var x1 = centerX + oterCircle * cos(i* pi / 180);
      var y1 = centerX + oterCircle * sin(i* pi / 180);

      var x2 = centerX + innerCircle * cos(i* pi / 180);
      var y2 = centerX + innerCircle * sin(i* pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), outBrush);


    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
