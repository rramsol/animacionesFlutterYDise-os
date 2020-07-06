import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgresPage extends StatefulWidget {
  @override
  _CircularProgresPageState createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage>with SingleTickerProviderStateMixin {

  double porcentaje=0.0;
  double nuevoPorcentaje = 0.0;
  AnimationController controller;


  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {

      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      });

    });

    super.initState();
  }

  @override
  void dispose() {
  controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          setState(() {
            //empieza la animacion en el tiempo 0
            controller.forward(from: 0.0);
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10;
            if(nuevoPorcentaje>100){
              nuevoPorcentaje=0;
              porcentaje=0;
            }
          });
        },
      ),
       body: Center(
         child: Container(
           padding: EdgeInsets.all(5.0),
           width: 300,
           height: 300,
           //color: Colors.red,
           child: CustomPaint(
             painter: _MiradialProgress(porcentaje),
           ),
         ),
       ),
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
