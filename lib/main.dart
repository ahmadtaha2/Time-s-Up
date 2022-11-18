import 'package:flutter/material.dart';
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
// build the notification feature
// TODO: build the search feature (almost done, time for some back-end work)
// TODO: time limitation feature
// simplify the code as much as possible...
// TODO: => similar components
// TODO: => commons themes and so...