import 'package:backgroundscustompainter/src/widgets/redial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje>100){
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
          child: RadialProgressMio(
            porcentaje: porcentaje,
            colorPrimario: Colors.green,
            colorSecundario: Colors.red,
          ),
        ),
      ),
    );
  }
}
