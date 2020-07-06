import 'package:backgroundscustompainter/src/pages/animaciones_page.dart';
import 'package:backgroundscustompainter/src/pages/graficas_circulares_page.dart';
import 'file:///C:/Users/ronyr/OneDrive/Escritorio/App%20Flutter/FlutterUdemy/DiseniosYanimaciones/backgrounds_custom_painter/lib/src/labs/circular_progres_page.dart';
import 'package:backgroundscustompainter/src/pages/headers_page.dart';
import 'package:backgroundscustompainter/src/retos/cuadro_animado_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: GraficasCircularesPage()
    );
  }
}
