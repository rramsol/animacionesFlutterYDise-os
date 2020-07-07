import 'package:backgroundscustompainter/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child:Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: _Slides(),
              ),
              _Dots()
            ],
          ),
        ),
      ),
    );

  }
}

class _Dots extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget{
  final int index;
  _Dot(this.index);
  @override
  Widget build(BuildContext context) {

    //traemos el valor del provider con el model (get)

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration( milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index-0.5 && pageViewIndex < index+0.5)
                  ? Colors.blue:Colors.grey,
        shape: BoxShape.circle
      ),
    );

  }
}

class _Slides extends StatefulWidget {

  @override
  __SlidesState createState() => __SlidesState();

}

class __SlidesState extends State<_Slides> {

  PageController pageController = new PageController();

  @override
  void initState() {

    pageController.addListener(() {
      //print('pagina actual: ${ pageController.page }');
      Provider.of<SliderModel>(context,listen: false).currentPage = pageController.page;
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
        children: <Widget>[
          _Slide('assets/svg/1.svg'),
          _Slide('assets/svg/2.svg'),
          _Slide('assets/svg/3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svgPath;
  _Slide( this.svgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svgPath),
    );
  }
}



