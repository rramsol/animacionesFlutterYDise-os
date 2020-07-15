
import 'package:backgroundscustompainter/src/models/layout_model.dart';
import 'package:backgroundscustompainter/src/pages/emergency_page.dart';
import 'package:backgroundscustompainter/src/pages/launcher_page.dart';
import 'package:backgroundscustompainter/src/pages/launcher_tablet_page.dart';
import 'package:backgroundscustompainter/src/pages/sliver_list_page.dart';
import 'package:backgroundscustompainter/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:backgroundscustompainter/src/pages/pinteres_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChanger(2)),
        ChangeNotifierProvider(create: (_) => LayoutModel()),
      ],
        child: MyApp()
    ),
);


/*void main() => runApp(
    ChangeNotifierProvider(
        create: (_) => themeChanger(2),
        child: MyApp()
    )
);*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<themeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Material App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          /*print('orientacion $orientation');
          return Container(
            child: LauncherPage(),
          );*/

          final screenSize = MediaQuery.of(context).size;
          if ( screenSize.width > 500 ){
            return LauncherTabletPage();
          }else{
            return LauncherPage();
          }

        },
      ),
    );
  }
}
