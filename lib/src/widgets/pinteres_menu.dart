import 'package:flutter/material.dart';



class PinteresButton {
  final Function onPressed;
  final IconData icon;

  PinteresButton({@required this.onPressed,@required this.icon});

}

class PinteresMenu extends StatelessWidget {

final List<PinteresButton> items = [
  PinteresButton(icon:Icons.pie_chart,onPressed: (){print('icon pie_chart');}),
  PinteresButton(icon:Icons.search,onPressed: (){print('icon search');}),
  PinteresButton(icon:Icons.notification_important,onPressed: (){print('icon notification_important');}),
  PinteresButton(icon:Icons.supervised_user_circle,onPressed: (){print('icon supervised_user_circle');}),
];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all( Radius.circular(100) ),
          boxShadow:<BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5,
            )
          ]
        ),
        ),
    );
  }
}