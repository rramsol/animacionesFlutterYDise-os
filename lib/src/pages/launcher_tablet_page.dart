import 'package:backgroundscustompainter/src/models/layout_model.dart';
import 'package:backgroundscustompainter/src/pages/slideshow_page.dart';
import 'package:backgroundscustompainter/src/routes/routes.dart';
import 'package:backgroundscustompainter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:backgroundscustompainter/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final appTheme = Provider.of<themeChanger>(context);
    final layoutmodel= Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter -Tablet'),
        backgroundColor: appTheme.currentTheme.accentColor,
      ),
      drawer: _MenuPrincipalCustom(),
      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: double.infinity,
            child: _ListaOpcionesCustom(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: (appTheme.darkTheme)?Colors.grey:appTheme.currentTheme.accentColor,
          ),
          Expanded(
            child:layoutmodel.currentPage,
          )
        ],
      ),
      //body:
    );
  }
}

class _ListaOpcionesCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<themeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i)=>Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context,i)=>ListTile(
        leading: FaIcon( pageRoutes[i].icon,color: appTheme.accentColor,),
        title: Text( pageRoutes[i].titulo),
        trailing: Icon( Icons.chevron_right, color: appTheme.accentColor,),
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> pageRoutes[i].page));
          final layoutmodel= Provider.of<LayoutModel>(context,listen: false);
          layoutmodel.currentPage = pageRoutes[i].page;
        },
      ),
    );
  }
}

class _MenuPrincipalCustom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<themeChanger>(context);


    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: appTheme.currentTheme.accentColor,
                child: Text('FR', style: TextStyle(fontSize: 50),),
              ),
            ),

            Expanded(
              child: _ListaOpcionesCustom(),
            ),
            
            ListTile(
              leading: Icon( Icons.lightbulb_outline,color: appTheme.currentTheme.accentColor,),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                  activeColor: appTheme.currentTheme.accentColor,
                  value: appTheme.darkTheme,
                  onChanged: (value){
                    appTheme.darkTheme = value;
                  }
              ),
            ),

            ListTile(
              leading: Icon( Icons.add_to_home_screen,color: appTheme.currentTheme.accentColor,),
              title: Text('Custom Theme'),

              trailing: Switch.adaptive(
                  activeColor: appTheme.currentTheme.accentColor,
                  value: appTheme.customTheme,
                  onChanged: (value){
                    appTheme.customTheme = value;
                  },
              ),
            )

          ],
        ),
      ),
    );
  }
}
