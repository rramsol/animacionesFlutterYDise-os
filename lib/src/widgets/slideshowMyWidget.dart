
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowMyWidget extends StatelessWidget {

   final List<Widget> slides;
   final bool puntosArriba;
   final Color colorPrimario;
   final Color colorSecundario;
   final double tamanoPuntoPrimario;
   final double tamanoPuntoSecundario;


  SlideShowMyWidget({
   @required this.slides,
    this.puntosArriba= false,
    this.colorSecundario = Colors.grey,
    this.colorPrimario = Colors.blue,
    this.tamanoPuntoPrimario =12,
   this.tamanoPuntoSecundario = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SlidershowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context){

              Provider.of<SlidershowModel>(context).colorPrimario = this.colorPrimario;
              Provider.of<SlidershowModel>(context).colorSecundario = this.colorSecundario;

              Provider.of<SlidershowModel>(context).tamanoPuntoPrimario = this.tamanoPuntoPrimario;
              Provider.of<SlidershowModel>(context).tamanoPuntoSecundario = this.tamanoPuntoSecundario;

              return Column(
                children: <Widget>[
                  if(this.puntosArriba) _Dots( this.slides.length),
                  Expanded(
                    child: _Slides( this.slides ),
                  ),
                  if(!this.puntosArriba) _Dots( this.slides.length),
                ],
              );
            },
          )
        ),
      ),
    );
  }

}

class _Dots extends StatelessWidget{

  final int totalSlides;


  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index)),
        /*children: <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],*/
      ),
    );
  }
}

class _Dot extends StatelessWidget{
  final int index;


  _Dot(
  this.index,
  );

  @override
  Widget build(BuildContext context) {

    double tamano;
    Color color;

    //traemos el valor del provider con el model (get)

    final ssmodel = Provider.of<SlidershowModel>(context);

    if(ssmodel.currentPage >= index-0.5 && ssmodel.currentPage < index+0.5){
      tamano = ssmodel.tamanoPuntoPrimario;
      color = ssmodel.colorPrimario;
    }else{
      tamano = ssmodel.tamanoPuntoSecundario;
      color = ssmodel.colorSecundario;
    }


    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
      ),
    );

  }
}



class _Slides extends StatefulWidget {
  //
  final List<Widget> slides;
  //constructor
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();

}

class __SlidesState extends State<_Slides> {

  PageController pageController = new PageController();

  @override
  void initState() {

    pageController.addListener(() {
      Provider.of<SlidershowModel>(context,listen: false).currentPage = pageController.page;
    });


    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
        /*children: <Widget>[
          _Slide('assets/svg/1.svg'),
          _Slide('assets/svg/2.svg'),
          _Slide('assets/svg/3.svg'),
        ],*/
        children: widget.slides.map((slide) => _Slide( slide )).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide( this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}


class SlidershowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _tamanoPuntoPrimario=12;
  double _tamanoPuntoSecundario=12;


  double get currentPage => this._currentPage;
  set currentPage( double currentPage ){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario( Color colorPrimario ){
    this._colorPrimario = colorPrimario;

  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario( Color colorSecundario ){
    this._colorSecundario = colorSecundario;

  }

  double get tamanoPuntoPrimario => this._tamanoPuntoPrimario;
  set tamanoPuntoPrimario ( double tamanoPuntoPrimario ){
    this._tamanoPuntoPrimario = tamanoPuntoPrimario;

  }

  double get tamanoPuntoSecundario => this._tamanoPuntoSecundario;
  set tamanoPuntoSecundario( double tamanoPuntoSecundario ){
    this._tamanoPuntoSecundario = tamanoPuntoSecundario;

}




}