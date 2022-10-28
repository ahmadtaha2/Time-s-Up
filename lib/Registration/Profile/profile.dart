import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pro1/Home_Page/add_account.dart';
import 'package:pro1/Home_Page/switch_account.dart';
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
        drawer: Drawer(
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
                leading: Icon(Icons.home, color: fontColor1,),
                title: _themes.menuText('Home'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(Icons.add_box_outlined, color: fontColor1,),
                title: _themes.menuText('Add Account'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddAccount(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.switch_account_outlined, color: fontColor1,),
                title: _themes.menuText('Switch Account'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SwitchAccount(),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.center_focus_strong_outlined),
                title: const Text('Activate/Deactivate focus mode'),
                onTap: () => {},
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode_outlined),
                title: const Text(
                  'Turn On/Off dark mode',
                ),
                onTap: () => {},
              ),
              ListTile(
                leading: const Icon(Icons.translate_sharp),
                title: const Text('Change language'),
                onTap: () => {},
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.border_color),
                title: const Text('Feedback'),
                onTap: () => {},
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () => {
                  logIn = false,
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()))
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: background1,
          elevation: 0,
          leading: Builder(
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
          ),
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
                  left: 50,
                  bottom: 50,
                ),
                child: Text(
                  'PROFILE',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: fontColor2,
                  ),
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
                height: 515,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: background3,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: circleImageColor1,
                      child: Icon(
                        Icons.person,
                        color: circleImageColor2,
                        size: 80,
                      ),
                    ),
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

/*
ListView(
                            //   children: [
                            //     ListTile(
                            //       leading: const Text(
                            //         'Name',
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 15,
                            //         ),
                            //       ),
                            //       trailing: TextButton(
                            //         onPressed: () {},
                            //         child: Row(
                            //           children: [
                            //             Text(
                            //               'name',
                            //               style: TextStyle(
                            //                 color: fontColor1,
                            //               ),
                            //             ),
                            //             Icon(
                            //               Icons.arrow_forward,
                            //               color: fontColor1,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
 */

/*
bottomNavigationBar: GNav(
          onTabChange: (index) => setState(() => currentIndex = index),
          selectedIndex: currentIndex,
          backgroundColor: theme2,
          rippleColor: Colors.white30,
          // the color of the  effect of the click
          hoverColor: Colors.white30,
          // the color of the button holding or clicking(after the rippleColor occurrence)
          gap: 8,
          // is the space between the buttons
          activeColor: Colors.black,
          // the color of the active button
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          color: Colors.white,
          tabBackgroundColor: Colors.white60,
          // the back color of the button
          tabs: const [
            GButton(
              icon: Icons.devices_other,
              text: 'Device',
            ),
            GButton(
              icon: Icons.app_registration,
              text: 'App',
            ),
            GButton(
              icon: Icons.web,
              text: 'Website',
            ),
          ],
        ),
 */
