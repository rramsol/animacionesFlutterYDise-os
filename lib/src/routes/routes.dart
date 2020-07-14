
import 'package:backgroundscustompainter/src/pages//slideshow_page.dart';
import 'package:backgroundscustompainter/src/pages/animaciones_page.dart';
import 'package:backgroundscustompainter/src/pages/emergency_page.dart';
import 'package:backgroundscustompainter/src/pages/graficas_circulares_page.dart';
import 'package:backgroundscustompainter/src/pages/headers_page.dart';
import 'package:backgroundscustompainter/src/pages/pinteres_page.dart';
import 'package:backgroundscustompainter/src/pages/sliver_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final pageRoutes = <_Route>[

  _Route( FontAwesomeIcons.slideshare, 'Slideshow',  SlideShowPage() ),
  _Route( FontAwesomeIcons.ambulance, 'Emergencia',  EmergencyPage() ),
  _Route( FontAwesomeIcons.heading, 'Encabezados',  HeadersPage() ),
  _Route( FontAwesomeIcons.peopleCarry, 'Cuadro animado',  CuadroAnimado() ),
  _Route( FontAwesomeIcons.circleNotch, 'Barra progreso',  GraficasCircularesPage() ),
  _Route( FontAwesomeIcons.pinterest, 'Pinterest',  PinteresPage() ),
  _Route( FontAwesomeIcons.mobile, 'Slivers',  SliverListPage() ),

];




class _Route{
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon,this.titulo,this.page);
}