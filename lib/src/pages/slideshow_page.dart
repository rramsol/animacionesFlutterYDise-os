import 'package:backgroundscustompainter/src/theme/theme.dart';
import 'package:backgroundscustompainter/src/widgets/slideshowMyWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<themeChanger>(context);
    return Scaffold(
      body: SlideShowMyWidget(
        tamanoPuntoPrimario: 20,
        tamanoPuntoSecundario: 15,
        puntosArriba: false,
        colorPrimario: (appTheme.darkTheme) ?  appTheme.currentTheme.accentColor:Colors.green,
        slides: <Widget>[
          SvgPicture.asset('assets/svg/1.svg'),
          SvgPicture.asset('assets/svg/2.svg'),
          SvgPicture.asset('assets/svg/3.svg'),
          SvgPicture.asset('assets/svg/4.svg'),
          SvgPicture.asset('assets/svg/5.svg'),
        ],
      )
    );

  }

}
