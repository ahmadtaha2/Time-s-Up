import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/Child_Version/Child_Home.dart';
import 'launch.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Launch(),
      ),
    ); // MaterialApp
  }
}
// TODO: check the code for any TODOs to finish
// TODO: build the notification feature