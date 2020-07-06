import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadroAnimado(),
      ),
    );
  }

}

//se anima el cuadro en un statefulWidget
class CuadroAnimado extends StatefulWidget {
  @override
  _CuadroAnimadoState createState() => _CuadroAnimadoState();
}

class _CuadroAnimadoState extends State<CuadroAnimado> with SingleTickerProviderStateMixin {
  //el animationController nos sirve para poder controlar la animacion como que fuera los controles
  //de un video
  AnimationController controller;
  //Animation es la animacion que queremos que haga en el tiempo que le diga el controller
  Animation<double> rotacion;
  //Animation para la opacidad
  Animation<double> opacidad;
  //Animation para la opacidad out
  Animation<double> opacidadOut;
  //animation para mover a la derecha
  Animation<double> moverDerecha;
  //animattion para agrandar
  Animation<double> agrandar;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    //vuelta completa por el PI
   // rotacion = Tween(begin: 0.0,end: 2.0*Math.pi).animate(controller);
    rotacion = Tween(begin: 0.0,end: 2.0*Math.pi).animate(
     CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint)
    );
    //controlamos la opacidad con el intervalo de tiempo en este caso al durar la animacion 4 seg
    //le decimos que haga la opacidad en 1 seg por medio del interval (porcentaje)
    opacidad = Tween(begin: 0.0,end: 1.0).animate(
        CurvedAnimation(parent: controller,curve: Interval( 0,0.25,curve: Curves.easeInOutQuint))
    );
    opacidadOut = Tween(begin: 1.0,end: 0.0).animate(
        CurvedAnimation(parent: controller,curve: Interval( 0.75,1.0,curve: Curves.ease))
    );
    //mover a la derecha
    moverDerecha = Tween(begin: 0.0,end: 200.0).animate(
        CurvedAnimation(parent: controller,curve: Curves.easeInOutQuint)
    );
    //Agrandar
    agrandar = Tween(begin: 0.0,end: 2.0).animate(
        CurvedAnimation(parent: controller,curve: Curves.easeInOutQuint)
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
        //controller.reverse();
        controller.reset();
      }
    });


    super.initState();
  }

  @override
  void dispose() {
   //siempre damos de baja el controller para evitar fuga de memoria
    controller.dispose();
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {

    //play
    controller.forward();

    /*aqui retornamos el rectangulo con el controles y le decimos que se reproduzca
     envuelto en un animatedBuilder y transform.rotate la rotacion.value es el que incrementa
     de valor en los 4 segundos que le dijimos en el controller*/
   return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(moverDerecha.value,0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                  scale: agrandar.value,
                  child: Opacity(
                      opacity: opacidadOut.value,
                      child: childRectangulo
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}

//se crea el rectangulo
class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }

}
