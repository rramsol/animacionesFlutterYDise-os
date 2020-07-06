import 'package:backgroundscustompainter/src/pages/animaciones_page.dart';
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
      home: CuadroAnimadoPage()
    );
  }
}
