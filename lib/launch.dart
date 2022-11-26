import 'package:flutter/material.dart';
import 'package:pro1/Registration/SignUp.dart' as t;
import 'dart:async';

import 'package:pro1/app_themes.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

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
              Material(
                color: Colors.transparent,
                elevation: 40,
                child: Image.asset(
                  'media/images/time_exploit.png',
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Material(
                color: Colors.transparent,
                elevation: 40,
                child: Text(
                  'Time Exploit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
