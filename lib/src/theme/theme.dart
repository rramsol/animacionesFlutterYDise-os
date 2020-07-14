import 'package:flutter/material.dart';

class themeChanger with ChangeNotifier{

  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;
  //Constructores

  themeChanger( int theme ){

    switch(theme){
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;

      case 2: //Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: //Custom
        _darkTheme = false;
        _customTheme = true;

        break;

    }
  }

  //GETTERS
  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;

  ThemeData get currentTheme => this._currentTheme;




  //SETTERS
  set darkTheme(bool value){
    _customTheme = false;
    _darkTheme = value;

    if( value ){
      _currentTheme = ThemeData.dark();
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
  set customTheme(bool value){
    _customTheme = value;
    _darkTheme = false;

    if( value ){
      _currentTheme = ThemeData.dark().copyWith(
        primaryColorLight:Color(0xff48A0EB) ,
        accentColor: Color(0xff48A0EB),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1:TextStyle( color: Colors.white ) ,

        ),
      );
    }else{
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}