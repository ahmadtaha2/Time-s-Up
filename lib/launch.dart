import 'package:flutter/material.dart';
import 'package:pro1/Registration/SignUp.dart' as t;
import 'dart:async';

import 'package:pro1/app_themes.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

// Color theme1 = const Color.fromRGBO(226, 228, 229, 1);
// Color theme2 = Colors.blue[300]!;

class StartState extends State<Launch> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Duration duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const t.SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background1,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'media/images/On_Time.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'On Time',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
