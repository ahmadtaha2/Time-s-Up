import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/Parent_Version/parent_home.dart';
import 'package:pro1/Home_Page/Single_User_Version/single_user_home.dart';
import 'package:pro1/Registration/choose_mode.dart';
import 'package:pro1/app_themes.dart';

class SwitchUserMode extends StatefulWidget {
  const SwitchUserMode({Key? key}) : super(key: key);

  @override
  State<SwitchUserMode> createState() => _SwitchUserModeState();
}

class _SwitchUserModeState extends State<SwitchUserMode> {
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
                      'media/images/time_exploit.png',
                      width: 100,
                      height: 100,
                    ),
                    const Text(
                      'Time Exploit',
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 30,
                          child: _themes.title('Switch User Mode'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 30,
                      child: Text(
                        'Are you sure you want to switch to ${userIndex == 0 ? 'personal' : 'family'} mode?',
                        style: TextStyle(
                          color: fontColor4,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 30,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: ((context) => userIndex == 0? SingleUserHomePage() : ParentHomePage()),
                                ),
                              );
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: fontColor4,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 30,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: fontColor4,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
