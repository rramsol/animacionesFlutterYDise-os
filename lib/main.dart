
import 'package:backgroundscustompainter/src/pages/emergency_page.dart';
import 'package:backgroundscustompainter/src/pages/launcher_page.dart';
import 'package:backgroundscustompainter/src/pages/sliver_list_page.dart';
import 'package:backgroundscustompainter/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:backgroundscustompainter/src/pages/pinteres_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(
        create: (_) => themeChanger(2),
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<themeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Material App',
      home: LauncherPage(),
    );
  }
}
