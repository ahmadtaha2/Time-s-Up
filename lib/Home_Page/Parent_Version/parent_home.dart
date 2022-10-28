import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pro1/Home_Page/add_account.dart';
import 'package:pro1/Home_Page/app_tab.dart';
import 'package:pro1/Home_Page/device_tab.dart';
import 'package:pro1/Home_Page/switch_account.dart';
import 'package:pro1/Home_Page/website_tab.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/launch.dart';

class ParentHomePage extends StatefulWidget {
  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
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
        backgroundColor: theme2,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: theme2,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Menu',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: const Icon(Icons.add_box_outlined),
                title: const Text('Add account'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddAccount(),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.switch_account_outlined),
                title: const Text('Switch account'),
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
                leading: const Icon(Icons.exit_to_app),
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
          backgroundColor: theme2,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            ),
          ],
        ),
        body: _pages[currentIndex],
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
      ),
    );
  }
}
