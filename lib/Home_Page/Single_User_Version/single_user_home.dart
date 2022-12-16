import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pro1/Home_Page/Menu_Pages/add_account.dart';
import 'package:pro1/Home_Page/app_tab.dart';
import 'package:pro1/Home_Page/device_tab.dart';
import 'package:pro1/Home_Page/Menu_Pages/switch_account.dart';
import 'package:pro1/Home_Page/website_tab.dart';
import 'package:pro1/Profile/profile.dart';
import 'package:pro1/Registration/choose_mode.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/Theme/app_themes.dart';


class SingleUserHomePage extends StatefulWidget {
  @override
  State<SingleUserHomePage> createState() => _SingleUserHomePageState();
}

class _SingleUserHomePageState extends State<SingleUserHomePage> {

///TODO: add the profile_image picker.dart content here instead

  bool value = true;
  bool logIn = true;
  int currentIndex = 0;
  final List<StatefulWidget> _pages = [
    const Device(),
    const App(),
    const Website(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background4,
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
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                    ),
                    const Text('username'),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: fontColor1,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(
                  Icons.add_box_outlined,
                  color: fontColor1,
                ),
                title: Text(
                  'Add account',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
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
                title: Text(
                  'Switch account',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SwitchAccount(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.swap_horiz_sharp,
                  color: fontColor1,
                ),
                title: Text(
                  'Switch user mode',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChooseMode(),
                  ),
                ),
              ),
              ListTile(
                //FIXME: not active yet
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: fontColor1,
                ),
                title: Text(
                  'Turn On/Off dark mode',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
                trailing: switchTheme(),
              ),
              ListTile(
                //TODO: not active yet
                leading: Icon(
                  Icons.translate_sharp,
                  color: fontColor1,
                ),
                title: Text(
                  'Change language',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
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
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
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
          backgroundColor: background4,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: fontColor3,
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const ProfilePage()),
                    ),
                  );
                },
                icon: Icon(
                  Icons.person,
                  color: fontColor3,
                ),
              ),
            ),
          ],
        ),
        body: _pages[currentIndex],
        bottomNavigationBar: GNav(
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
      ),
    );
  }

  //FIXME: fix the theme button
  Widget switchTheme() => Switch.adaptive(
        activeTrackColor: Colors.white60,
        activeColor: Colors.white,
        value: value,
        onChanged: ((value) => setState(
              () => this.value = value,
            )),
      );
}


/**
 * This is the foucus mode feature.
 * I removed it as you reqested...
 * 
 * 
 * ListTile(
                leading: Icon(
                  Icons.center_focus_strong_outlined,
                  color: fontColor1,
                ),
                title: Text(
                  'Activate/Deactivate focus mode',
                  style: TextStyle(
                    color: fontColor1,
                  ),
                ),
                onTap: () => {},
              ),
 *
 */
