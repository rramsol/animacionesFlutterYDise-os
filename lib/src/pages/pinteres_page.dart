import 'package:backgroundscustompainter/src/theme/theme.dart';
import 'package:backgroundscustompainter/src/widgets/pinteres_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinteresPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> _MenuModel(),
      child: Scaffold(
        body: Stack(
          //child: PinteresMenu(),
          //child: _PinteresGrid(),
          children: <Widget>[
            _PinteresGrid(),
            _PinteresMenuLocation(),
          ],
          ),
      ),
    );
  }
}

class _PinteresMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<themeChanger>(context).currentTheme;

    if(widthPantalla > 500){
      widthPantalla = widthPantalla-300;
    }

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Row(
          children: <Widget>[
            Spacer(),
            PinteresMenu(
              mostrar: mostrar,
              backgroundMenu: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              inactiveColor: Colors.pink,
              items: [
                PinteresButton(icon:Icons.pie_chart,onPressed: (){print('icon pie_chart');}),
                PinteresButton(icon:Icons.search,onPressed: (){print('icon search');}),
                PinteresButton(icon:Icons.notification_important,onPressed: (){print('icon notification_important');}),
                PinteresButton(icon:Icons.supervised_user_circle,onPressed: (){print('icon supervised_user_circle');})
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _PinteresGrid extends StatefulWidget{

  @override
  __PinteresGridState createState() => __PinteresGridState();
}

class __PinteresGridState extends State<_PinteresGrid> {

  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior=0;

  @override
  void initState() {

    controller.addListener(() {
      //print('${controller.offset}');

      if(controller.offset > scrollAnterior){
        Provider.of<_MenuModel>(context, listen: false).mostrar=false;
      }else{
        Provider.of<_MenuModel>(context, listen: false).mostrar=true;
      }

      scrollAnterior = controller.offset;

    });

    super.initState();
  }

  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int count;
    if( MediaQuery.of(context).size.width > 500){
      count = 3;
    }else{
      count = 2;
    }

    return  StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(index),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {

  final int index;
  _PinteresItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier{

  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar( bool valor ){
    this._mostrar = valor;
    notifyListeners();
  }


}