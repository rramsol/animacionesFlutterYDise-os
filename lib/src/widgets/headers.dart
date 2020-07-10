import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        )
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //configuracion del lapiz
    lapiz.color= Color(0xff615AAB);
    lapiz.style= PaintingStyle.fill; //.stroke solo dibuja las lineas fill lo rellena
    lapiz.strokeWidth = 5;

    final path = Path();

    //Dibujo con el path y el lapiz
    path.moveTo(0, size.height*0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    //dibuja
    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        )
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //configuracion del lapiz
    lapiz.color= Color(0xff615AAB);
    lapiz.style= PaintingStyle.fill; //.stroke solo dibuja las lineas fill lo rellena
    lapiz.strokeWidth = 50;

    final path = Path();

    //Dibujo con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);




    //dibuja
    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderPicoPainter(),
        )
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //configuracion del lapiz
    lapiz.color= Color(0xff615AAB);
    lapiz.style= PaintingStyle.fill; //.stroke solo dibuja las lineas fill lo rellena
    lapiz.strokeWidth = 50;

    final path = Path();

    //Dibujo con el path y el lapiz
    path.lineTo(0, size.height*0.25);
    path.lineTo(size.width*0.5, size.height*0.35);
    path.lineTo(size.width, size.height*0.25);
    path.lineTo(size.width, 0);






    //dibuja
    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderCurvoPainter(),
        )
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //configuracion del lapiz
    lapiz.color= Color(0xff615AAB);
    lapiz.style= PaintingStyle.fill; //.stroke solo dibuja las lineas fill lo rellena
    lapiz.strokeWidth = 50;

    final path = Path();

    //Dibujo con el path y el lapiz
    path.lineTo(0, size.height*0.15);
    path.quadraticBezierTo(size.width*0.5,size.height*0.4 , size.width, size.height*0.15);
    path.lineTo(size.width, 0);





    //dibuja
    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWavePainter(),
        )
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    //configuracion del lapiz
    lapiz.color= Color(0xff615AAB);
    lapiz.style= PaintingStyle.fill; //.stroke solo dibuja las lineas fill lo rellena
    lapiz.strokeWidth = 50;

    final path = Path();

    //Dibujo con el path y el lapiz
    path.lineTo(0, size.height*0.35);
    path.quadraticBezierTo(size.width*0.25, size.height*0.45 ,size.width*0.5, size.height*0.35);
    path.quadraticBezierTo(size.width*.75, size.height*0.25 ,size.width, size.height*0.35);
    path.lineTo(size.width, 0);




    //dibuja
    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWaveGradientPainter(),
        )
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: Offset(0.0,55.0),
      radius: 180,
    );

    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0Xff6D05FA),
      ],
      stops: [
        0.2,
        0.5,
        1.0
      ]
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    //configuracion del lapiz
    lapiz.color= Color(0xff615AAB);
    lapiz.style= PaintingStyle.fill; //.stroke solo dibuja las lineas fill lo rellena
    lapiz.strokeWidth = 50;

    final path = Path();

    //Dibujo con el path y el lapiz
    path.lineTo(0, size.height*0.35);
    path.quadraticBezierTo(size.width*0.25, size.height*0.45 ,size.width*0.5, size.height*0.35);
    path.quadraticBezierTo(size.width*.75, size.height*0.25 ,size.width, size.height*0.35);
    path.lineTo(size.width, 0);




    //dibuja
    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}


//emergencyPAGE
class IconHeader extends StatelessWidget {

  final IconData iconFondo;
  final IconData iconPrincipal;
  final String titulo;
  final String subTitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.iconFondo,
    @required this.titulo,
    @required this.subTitulo,
    this.color1 = Colors.blueGrey,
    this.color2 = Colors.greenAccent,
    @required this.iconPrincipal,

});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBack(color1: this.color1, color2: this.color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.iconFondo, size: 225,color: Colors.white.withOpacity(0.2),),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 80,width: double.infinity,),
            Text(this.titulo, style: TextStyle(color: Colors.white,fontSize: 20),),
            SizedBox(height: 20,),
            Text(this.subTitulo, style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            FaIcon(this.iconPrincipal, size: 80,color: Colors.white,),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBack extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBack({this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            color1,
            color2
          ]
        ),
      ),
    );
  }
}
