import 'package:flutter/material.dart';
import 'package:pro1/Home_Page/add_account.dart';
import 'package:pro1/Home_Page/switch_account.dart';
import 'package:pro1/Registration/login.dart';
import 'package:pro1/app_themes.dart';
import 'package:pro1/launch.dart';
import 'app_tab.dart';
import 'device_tab.dart';
import 'website_tab.dart';

///This file is not ready yet
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool logIn = true;

  final List<Widget> _pages = [
    const Device(),
    const App(),
    const Website(),
  ];
  final List _pageTitle = [
    'Device',
    'Apps',
    'Websites',
  ];

  int _selectedPageIndex = 0;

  void _x1(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
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
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAccount(),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.switch_account_outlined),
                  title: const Text('Switch account'),
                  onTap: () => Navigator.pushReplacement(
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
            backgroundColor: background2,
            title: Text(
              _pageTitle[_selectedPageIndex],
              style: const TextStyle(fontSize: 18),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ],
            // bottom: const TabBar(
            //   tabs: <Widget>[
            //     Tab(
            //       text: 'Device',
            //     ),
            //     Tab(
            //       text: 'App',
            //     ),
            //     Tab(
            //       text: 'Website',
            //     ),
            //   ],
            // ),
          ),
          body: _pages[_selectedPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.shifting,
            onTap: _x1,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.devices_other),
                label: 'Device',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.app_registration),
                label: 'App',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.web_outlined),
                label: 'Website',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
