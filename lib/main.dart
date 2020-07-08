
import 'package:flutter/material.dart';

import 'package:backgroundscustompainter/src/pages/pinteres_page.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PinteresPage(),
    );
  }
}
