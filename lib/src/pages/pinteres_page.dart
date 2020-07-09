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

    final widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: PinteresMenu(
            mostrar: mostrar,
          ),
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
    return  StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(index),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 2 : 3),
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