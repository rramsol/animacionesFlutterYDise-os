import 'package:animate_do/animate_do.dart';
import 'package:backgroundscustompainter/src/theme/theme.dart';
import 'package:backgroundscustompainter/src/widgets/Boton_gordo.dart';
import 'package:backgroundscustompainter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    final appTheme = Provider.of<themeChanger>(context);

    if( MediaQuery.of(context).size.height > 500 ){
      isLarge = true;
    }else {
      isLarge=false;
    }

    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map((e) =>
        ZoomIn(
          child: BotonGordo(
            icon: e.icon,
            texto: e.texto,
            color1: e.color1,
            color2: e.color2,
            onPress: (){ print('hola');},
    ),
        )).toList();


    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: (isLarge)?220:10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                if( isLarge )
                SizedBox(height: 80,),
                ...itemMap
              ],
            ),
          ),
          if ( isLarge)
          _Encabezado(),
        ],

      )
    );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          iconPrincipal: FontAwesomeIcons.infinity,
          titulo: 'Haz Solicitado',
          subTitulo: 'Asistencia medica',
          iconFondo: FontAwesomeIcons.infinity,
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
              onPressed: (){},
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
              elevation: 90,
              child: FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.white,)
          ),
        )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {

  const BotonGordoTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      color1: Colors.red,
      color2: Color(0xff906EF5),
      icon: FontAwesomeIcons.infinity,
      texto: 'Accidente de carro',
      onPress: (){print('hola');},
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      iconFondo: FontAwesomeIcons.plusCircle,
      iconPrincipal: FontAwesomeIcons.plus,
      titulo: 'Haz Solicitado',
      subTitulo: 'Asistencia Medica',
    );
  }
}