import 'package:flutter/material.dart';

//this import to use the defined colors in the theme mode
import 'package:pro1/Theme/app_themes.dart';

Themes _themes = Themes();

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: fontColor4,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  
);

/**
 * TODO: those are the widgets used in our app
 * 
 * TextFormField
 * ElevatedButton
 * TextButton
 * Card
 * Container
 * AppBar
 * Drawer
 * Text
 * InkWell
 * ListTile
 * Icon
 * IconButton
 * Chart
 * GNav
 * Search
 * Material
 * 
 */