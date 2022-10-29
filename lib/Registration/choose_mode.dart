import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/Parent_Version/parent_home.dart';
import 'package:pro1/Home_Page/Single_User_Version/single_user_home.dart';
import 'package:pro1/app_themes.dart';
import 'package:pro1/launch.dart';

class ChooseMode extends StatefulWidget {
  const ChooseMode({super.key});

  @override
  State<ChooseMode> createState() => _ChooseModeState();
}

// in this variable the user role/mode will be saved
String userMode = '';
int userIndex = -1;

class _ChooseModeState extends State<ChooseMode> {
  final Themes _themes = Themes();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background1,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                          fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  height: 775,
                  width: double.infinity,
                  decoration: _themes.screenDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _themes.title('CHOOSE MODE'),
                      _themes.trailing(
                        'Choose what purpose do you want to use the app for',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      IconButton(
                        /* when ever the user clicks
                        the image of the user mode -for easier use-
                        the user will be redirected to the home page
                        of the app according to user mode chosen */
                        onPressed: () {
                          setState(() {
                            userIndex = 0;
                            userMode = 'family';
                          });
                          //use this statement to check if the value is stored
                          //print(userMode);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParentHomePage(),
                            ),
                          );
                        },
                        icon: Image.asset(
                          'media/images/parents_portrait_transparent.png',
                        ),
                        iconSize: 250,
                      ),
                      Text(
                        'Parent (Family)',
                        style: TextStyle(color: Colors.orange[700]),
                      ),
                      IconButton(
                        /* when ever the user clicks
                        the image of the user mode -for easier use-
                        the user will be redirected to the home page
                        of the app according to user mode chosen */
                        onPressed: () {
                          setState(() {
                            userIndex = 1;
                            userMode = 'personal';
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleUserHomePage(),
                            ),
                          );
                        },
                        icon: Image.asset('media/images/User.png'),
                        iconSize: 250,
                      ),
                      Text(
                        'Single User (Personal)',
                        style: TextStyle(color: Colors.orange[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
