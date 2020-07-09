import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class PinteresButton {
  final Function onPressed;
  final IconData icon;

  PinteresButton({@required this.onPressed,@required this.icon});

}

//Este widget lleva el Provider por ser el mas alto en la jerarquia

class PinteresMenu extends StatelessWidget {

  final bool mostrar;

  PinteresMenu({this.mostrar = true});

final List<PinteresButton> items = [
  PinteresButton(icon:Icons.pie_chart,onPressed: (){print('icon pie_chart');}),
  PinteresButton(icon:Icons.search,onPressed: (){print('icon search');}),
  PinteresButton(icon:Icons.notification_important,onPressed: (){print('icon notification_important');}),
  PinteresButton(icon:Icons.supervised_user_circle,onPressed: (){print('icon supervised_user_circle');}),
];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: ( mostrar ) ? 1 : 0 ,
        child: _PinteresMenuBackground(
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinteresMenuBackground extends StatelessWidget {

  final Widget child;

  _PinteresMenuBackground({ @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
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
      );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinteresButton> menuItems;
  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index,menuItems[index])),

    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinteresButton item;

  _PinterestMenuButton( this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context,listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,//ayuda para que funcione en todos los dipositivos
      child: Container(
        child: Icon(item.icon,
        size: ( itemSeleccionado == index )? 35: 25,
          color:( itemSeleccionado == index )? Colors.black: Colors.blueGrey,
        ),
      ),
    );
  }
}


class _MenuModel with ChangeNotifier{

  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado ( int index ){
    this._itemSeleccionado = index;
    notifyListeners();
  }



}