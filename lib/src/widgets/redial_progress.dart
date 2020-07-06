import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadialProgressMio extends StatefulWidget {
  final porcentaje;

  RadialProgressMio({this.porcentaje});

  @override
  _RadialProgressMioState createState() => _RadialProgressMioState();
}

class _RadialProgressMioState extends State<RadialProgressMio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MiradialProgress(widget.porcentaje),
      )
    );
  }
}

class _MiradialProgress extends CustomPainter{

  final porcentaje;

  _MiradialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

    //dibujar circulo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width*0.5, size.height*0.5);
    final double radio = min(size.width*0.5, size.height*0.5);

    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2*pi*(porcentaje/100);
    canvas.drawArc(
        Rect.fromCircle(center: center,radius: radio),
        -pi/2,
        arcAngle,
        false,
        paintArco
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
