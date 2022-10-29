import 'package:flutter/material.dart';
import 'package:pro1/app_themes.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool visible = false;
  SnackBar editProfileMessage = const SnackBar(
    content: Text(
      'Saved!',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  bool logIn = true;
  final Themes _themes = Themes();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
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
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: fontColor2,
                    ),
                  ),
                ),
                Container(
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
                      /*
                      * the user entries must be saved
                      */
                      TextFormField(
                        /*edit name text field*/
                        keyboardType: TextInputType.name,
                        keyboardAppearance: Brightness.dark,
                        //controller: _usernameController,
                        decoration: _themes.textFormFieldDecoration('Name'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Invalid name';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          //_authData['username'] = newValue!;
                          //_usernameController.text = newValue;
                        },
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      TextFormField(
                        //username text field
                        keyboardType: TextInputType.name,
                        keyboardAppearance: Brightness.dark,
                        //controller: _usernameController,
                        decoration: _themes.textFormFieldDecoration('Username'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Invalid username';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          //_authData['username'] = newValue!;
                          //_usernameController.text = newValue;
                        },
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      TextFormField(
                        /* edit email text field*/
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        //controller: _usernameController,
                        decoration: _themes.textFormFieldDecoration('Email'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.com') ||
                              value.length < 12) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          //_authData['username'] = newValue!;
                          //_usernameController.text = newValue;
                        },
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      TextFormField(
                        //edit phone number text field
                        keyboardType: TextInputType.phone,
                        keyboardAppearance: Brightness.dark,
                        //controller: _usernameController,
                        decoration:
                            _themes.textFormFieldDecoration('Phone Number'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.length < 10) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          //_authData['username'] = newValue!;
                          //_usernameController.text = newValue;
                        },
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      TextFormField(
                        //edit password text field
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.dark,
                        //controller: _usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[50],
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              visible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                          ),
                        ),
                        obscureText: visible,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Invalid password';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          //_authData['username'] = newValue!;
                          //_usernameController.text = newValue;
                        },
                      ),
                      const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      TextFormField(
                        //Edit birthday text field
                        keyboardType: TextInputType.datetime,
                        keyboardAppearance: Brightness.dark,
                        //controller: _usernameController,
                        decoration: _themes.textFormFieldDecoration('Birthday'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.length < 10) {
                            return 'Invalid birthday';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          //_authData['username'] = newValue!;
                          //_usernameController.text = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          final bool isValid = formKey.currentState!.validate();
                          if (isValid) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(editProfileMessage);
                            Navigator.of(context).pop(context);
                          }
                        },
                        child: _themes.textButtonStyle('SAVE'),
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
