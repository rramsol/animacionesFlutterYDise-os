import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordo({
    this.icon    = FontAwesomeIcons.carCrash,
    this.texto   = 'TEXTO DE EJEMPLO',
    this.color1  = Colors.red,
    this.color2  = Colors.green,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
         children: <Widget>[
           _BotonGordoBack(
            color1: this.color1,
            color2: this.color2,
           ),
           Row(
             children: <Widget>[
               SizedBox(height: 140,width: 40,),
               FaIcon( this.icon, color: Colors.white,size: 40,),
               SizedBox(width: 25,),
               Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white)),),
               FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white),
               SizedBox(width: 40,)
             ],
           ),

         ],
      ),
    );
  }
}


class _BotonGordoBack extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _BotonGordoBack({
    this.color1,
    this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(color:  Colors.black.withOpacity(0.2),offset: Offset(4,6),blurRadius:5),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2,
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(FontAwesomeIcons.carCrash,size: 150,color: Colors.white.withOpacity(0.2),),
            )
          ],
        ),
      ),

    );
  }
}