import 'package:flutter/material.dart';
import 'package:pro1/Theme/theme_const.dart';
import 'package:pro1/Theme/theme_manager.dart';
import 'launch.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

final ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

// themeMode: ThemeMode.system,

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'Total Control',
      locale: Get.deviceLocale,
      home: const SafeArea(
        child: Launch(),
      ),
    );
  }
}


/* 
TODO:
  fix dark mode
  continue image_picker
  continue language files
  font family
*/