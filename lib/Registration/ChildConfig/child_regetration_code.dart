import 'package:flutter/material.dart';
import 'package:pro1/app_themes.dart';

class SupervisorEmail extends StatefulWidget {
  const SupervisorEmail({Key? key}) : super(key: key);

  @override
  State<SupervisorEmail> createState() => _SupervisorEmailState();
}

class _SupervisorEmailState extends State<SupervisorEmail> {
  final Themes _themes = Themes();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'media/images/On_Time.png',
                      width: 75,
                      height: 75,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'On Time',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: 775,
                decoration: _themes.screenDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    //TODO: a code will be revealed here to connect the child's device
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
