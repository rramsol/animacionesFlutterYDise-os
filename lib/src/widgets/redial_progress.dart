import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadialProgressMio extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  RadialProgressMio({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
  });

  @override
  _RadialProgressMioState createState() => _RadialProgressMioState();
}

class _RadialProgressMioState extends State<RadialProgressMio> with SingleTickerProviderStateMixin {

 AnimationController controller;
 double porcentajeAnterior;

 @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

   controller.forward(from: 0.0);
   final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
   porcentajeAnterior =widget.porcentaje;


   return AnimatedBuilder(
     animation: controller,
     builder: (context, Widget child){
       return Container(
           padding: EdgeInsets.all(10.0),
           width: double.infinity,
           height: double.infinity,
           child: CustomPaint(
             painter: _MiradialProgress((widget.porcentaje-diferenciaAnimar)+(diferenciaAnimar*controller.value),
             widget.colorPrimario,
               widget.colorSecundario
             ),
           )
       );
     },
   );
  }
}

class _MiradialProgress extends CustomPainter{

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  _MiradialProgress(this.porcentaje,this.colorPrimario,this.colorSecundario);

  @override
  void paint(Canvas canvas, Size size) {

    //dibujar circulo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width*0.5, size.height*0.5);
    final double radio = min(size.width*0.5, size.height*0.5);

    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = colorPrimario
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
