import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/Single_User_Version/single_user_home.dart';
import 'package:pro1/Registration/child_registration_code.dart';
import 'package:pro1/Theme/app_themes.dart';

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
                Material(
                  color: Colors.transparent,
                  elevation: 40,
                  child: appLogo(),
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
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: _themes.title('CHOOSE MODE'),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: _themes.trailing(
                          'Please choose your default user type',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: IconButton(
                          /*
                          when ever the user clicks
                          the image of the user mode -for easier use-
                          the user will be redirected to the home page
                          of the app according to user mode chosen
                          */
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
                                builder: (context) => const ChildRegistrationCode(),
                              ),
                            );
                          },
                          icon: Image.asset(
                            'media/images/parents_portrait_transparent.png',
                          ),
                          iconSize: 250,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: Text(
                          'Family',
                          style: TextStyle(
                            color: Colors.orange[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: IconButton(
                          /*
                          when ever the user clicks
                          the image of the user mode -for easier use-
                          the user will be redirected to the home page
                          of the app according to user mode chosen
                          */
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
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: Text(
                          'Personal / Individual',
                          style: TextStyle(
                            color: Colors.orange[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
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
