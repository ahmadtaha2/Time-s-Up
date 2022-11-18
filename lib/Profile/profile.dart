import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pro1/Profile/edit_profile.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/app_themes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool logIn = true;
  int currentIndex = 0;
  final Themes _themes = Themes();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background1,
        appBar: AppBar(
          backgroundColor: background1,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: circleImageColor2,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: _themes.screenDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 10,
                  bottom: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PROFILE',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: fontColor2,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const EditProfilePage()),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: fontColor2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.transparent,
                ),
                height: 565,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: background3,
                  ),
                  // TODO: fix and edit profile UIs (there is space in the bottom try to fix it)
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const EditProfilePage()),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 15,
                                  child: Text(
                                    'name',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: fontColor1,
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 15,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color: fontColor1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Material(
                        color: Colors.transparent,
                        elevation: 15,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 15,
                                  child: Text(
                                    'username',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: fontColor1,
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 15,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color: fontColor1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Material(
                        color: Colors.transparent,
                        elevation: 15,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'email',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: fontColor1,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color: fontColor1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Material(
                        color: Colors.transparent,
                        elevation: 15,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: Text(
                              'Phone number',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'phone',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: fontColor1,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color: fontColor1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Material(
                        color: Colors.transparent,
                        elevation: 15,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'password',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: fontColor1,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color: fontColor1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Material(
                        color: Colors.transparent,
                        elevation: 15,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: Text(
                              'Birthday',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 15,
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'birthday',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: fontColor1,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color: fontColor1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: _themes.textButtonStyle('LOGOUT'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
