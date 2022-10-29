import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pro1/Home_Page/add_account.dart';
import 'package:pro1/Home_Page/switch_account.dart';
import 'package:pro1/Registration/Profile/edit_profile.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/app_themes.dart';
import 'package:pro1/launch.dart';

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
        /*drawer: Drawer(
          backgroundColor: background1,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: background2,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                      color: fontColor1,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Username',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: fontColor1,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: fontColor1,
                ),
                title: _themes.menuText('Home'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(
                  Icons.add_box_outlined,
                  color: fontColor1,
                ),
                title: _themes.menuText('Add Account'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddAccount(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.switch_account_outlined,
                  color: fontColor1,
                ),
                title: _themes.menuText('Switch Account'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SwitchAccount(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.center_focus_strong_outlined,
                  color: fontColor1,
                ),
                title: _themes.menuText('Focus Mode'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: fontColor1,
                ),
                title: _themes.menuText('Dark Mode'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(
                  Icons.translate_sharp,
                  color: fontColor1,
                ),
                title: _themes.menuText('Change Language'),
                onTap: () => {},
              ),
              Divider(
                color: fontColor1,
              ),
              ListTile(
                leading: Icon(
                  Icons.border_color,
                  color: fontColor1,
                ),
                title: _themes.menuText('Feedback'),
                onTap: () => {},
              ),
              Divider(
                color: fontColor1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: fontColor1,
                ),
                title: _themes.menuText('Logout'),
                onTap: () => {
                  logIn = false,
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()))
                },
              ),
            ],
          ),
        ),*/
        appBar: AppBar(
          backgroundColor: background1,
          elevation: 0,
          /*leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: background3,
                ),
              );
            },
          ),*/
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
                height: 518.6,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'name',
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
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'username',
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
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
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
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Phone number',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
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
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
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
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Birthday',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
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
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: _themes.textButtonStyle('LOGOUT'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        /*bottomNavigationBar: GNav(
          onTabChange: (index) => setState(() => currentIndex = index),
          selectedIndex: currentIndex,
          backgroundColor: background2,
          rippleColor: background1,
          hoverColor: background1,
          gap: 16,
          activeColor: fontColor3,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          color: fontColor1,
          tabBackgroundColor: background4,
          tabMargin: const EdgeInsets.symmetric(horizontal: 35),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),*/
      ),
    );
  }
}
